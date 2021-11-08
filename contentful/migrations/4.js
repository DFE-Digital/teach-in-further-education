module.exports = function (migration) {
    const userInput = migration
        .createContentType("userInput")
        .name("userInput")
        .description("")
        .displayField("inputText");

    userInput
        .createField("inputText")
        .name("inputText")
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

    userInput
        .createField("subText")
        .name("Sub text")
        .type("Text")
        .localized(false)
        .required(false)
        .validations([])
        .disabled(false)
        .omitted(false);

    userInput.changeFieldControl("inputText", "builtin", "singleLine", {});
    userInput.changeFieldControl("subText", "builtin", "singleLine", {});

};