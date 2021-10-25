module.exports = function (migration) {
    const userInput = migration
        .createContentType("Panel")
        .name("Panel")
        .description("")
        .displayField("panelText");

    userInput
        .createField("panelText")
        .name("panelText")
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
        .createField("PanelSubText")
        .name("PanelSubText")
        .type("Text")
        .localized(false)
        .required(false)
        .validations([])
        .disabled(false)
        .omitted(false);

    userInput.changeFieldControl("panelText", "builtin", "singleLine", {});
    userInput.changeFieldControl("PanelSubText", "builtin", "singleLine", {});

};