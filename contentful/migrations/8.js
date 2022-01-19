module.exports = function (migration) {
    const lineBreak = migration
        .createContentType("lineBreak")
        .name("lineBreak")
        .description("")
        .displayField("title");

    lineBreak
        .createField("title")
        .name("title")
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

    lineBreak.changeFieldControl("title", "builtin", "singleLine", {});

};