module.exports = function (migration) {
  const pageGroup = migration.editContentType("page");
  pageGroup.editField("blocks").items({
    type: "Link",
    validations: [
      {
        linkContentType: [
          "advice",
          "columnarLayout",
          "conditionalRadio",
          "heroBanner",
          "question",
          "userJourney",
          "story",
          "tableOfContents",
          "userInput",
          "Panel",
          "lineBreak",
        ],
      },
    ],

    linkType: "Entry",
  });
};
