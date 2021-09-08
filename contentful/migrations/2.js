module.exports = function (migration) {
    const page = migration.editContentType('page')

    page
        .createField("navTitle")
        .name("Navigation Title")
        .type("Symbol")
        .localized(false)
        .required(true)
        .validations([
            {
                unique: true,
            },
        ])
        .disabled(false)
        .omitted(false);
};