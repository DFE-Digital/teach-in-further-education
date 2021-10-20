module.exports = function (migration) {
    const questionGroup = migration.editContentType('question')
    questionGroup.editField('answers')
        .validations([
            {
                size: {
                    min: 1,
                },
            },
        ]);

    questionGroup.editField('renderAs').items({
        type: "Symbol",

        validations: [
            {
                in: ["Dropdown", "Radio button", "Checkbox"],
            },
        ],
    });
};