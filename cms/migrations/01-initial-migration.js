module.exports = function (migration) {
  const page = migration
    .createContentType("page")
    .name("Page")
    .description("")
    .displayField("title");

  page
    .createField("title")
    .name("Title")
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

  page
    .createField("preamble")
    .name("Preamble")
    .type("Text")
    .localized(false)
    .required(false)
    .validations([])
    .disabled(false)
    .omitted(false);
  
  page
    .createField("heading")
    .name("Heading")
    .type("Symbol")
    .localized(false)
    .required(false)
    .validations([])
    .disabled(false)
    .omitted(false);

  page
    .createField("slug")
    .name("Slug")
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

  page
    .createField("blocks")
    .name("Blocks")
    .type("Array")
    .localized(false)
    .required(false)
    .validations([])
    .disabled(false)
    .omitted(false)
    .items({
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
          ],
        },
      ],

      linkType: "Entry",
    });

  page
    .createField("callToActions")
    .name("Call to actions")
    .type("Array")
    .localized(false)
    .required(false)
    .validations([])
    .disabled(false)
    .omitted(false)
    .items({
      type: "Link",

      validations: [
        {
          linkContentType: ["callToAction"],
        },
      ],

      linkType: "Entry",
    });

  page.changeFieldControl("title", "builtin", "singleLine", {});
  page.changeFieldControl("preamble", "builtin", "markdown", {});
  page.changeFieldControl("heading", "builtin", "singleLine", {});
  page.changeFieldControl("slug", "builtin", "slugEditor", {});
  page.changeFieldControl("blocks", "builtin", "entryCardsEditor", {});

  page.changeFieldControl("callToActions", "builtin", "entryCardsEditor", {
    bulkEditing: true,
    showLinkEntityAction: true,
    showCreateEntityAction: true,
  });

  const conditionalRadio = migration
    .createContentType("conditionalRadio")
    .name("Conditional Radio")
    .description(
      "Based on this from GDS https://design-system.service.gov.uk/components/radios/"
    )
    .displayField("title");

  conditionalRadio
    .createField("title")
    .name("Title")
    .type("Symbol")
    .localized(false)
    .required(false)
    .validations([])
    .disabled(false)
    .omitted(false);
  conditionalRadio
    .createField("preamble")
    .name("Preamble")
    .type("Text")
    .localized(false)
    .required(false)
    .validations([])
    .disabled(false)
    .omitted(false);

  conditionalRadio
    .createField("options")
    .name("Options")
    .type("Array")
    .localized(false)
    .required(true)
    .validations([])
    .disabled(false)
    .omitted(false)
    .items({
      type: "Link",

      validations: [
        {
          linkContentType: ["option"],
        },
      ],

      linkType: "Entry",
    });

  conditionalRadio.changeFieldControl("title", "builtin", "singleLine", {});
  conditionalRadio.changeFieldControl("preamble", "builtin", "markdown", {});
  conditionalRadio.changeFieldControl(
    "options",
    "builtin",
    "entryLinksEditor",
    {}
  );
  const option = migration
    .createContentType("option")
    .name("Option")
    .description("")
    .displayField("title");
  option
    .createField("title")
    .name("Title")
    .type("Symbol")
    .localized(false)
    .required(true)
    .validations([])
    .disabled(false)
    .omitted(false);

  option
    .createField("blocks")
    .name("Blocks")
    .type("Array")
    .localized(false)
    .required(true)
    .validations([])
    .disabled(false)
    .omitted(false)
    .items({
      type: "Link",

      validations: [
        {
          linkContentType: ["advice"],
        },
      ],

      linkType: "Entry",
    });

  option.changeFieldControl("title", "builtin", "singleLine", {});
  option.changeFieldControl("blocks", "builtin", "entryLinksEditor", {});
  const story = migration
    .createContentType("story")
    .name("Story")
    .description("")
    .displayField("title");

  story
    .createField("title")
    .name("Title")
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

  story
    .createField("storyBody")
    .name("Story body")
    .type("Text")
    .localized(false)
    .required(true)
    .validations([])
    .disabled(false)
    .omitted(false);
  story
    .createField("media")
    .name("Media")
    .type("Link")
    .localized(false)
    .required(false)
    .validations([])
    .disabled(false)
    .omitted(false)
    .linkType("Asset");
  story
    .createField("storyLinkText")
    .name("Story link text")
    .type("Symbol")
    .localized(false)
    .required(false)
    .validations([])
    .disabled(false)
    .omitted(false);

  story
    .createField("storyPage")
    .name("Story page")
    .type("Link")
    .localized(false)
    .required(false)
    .validations([
      {
        linkContentType: ["page"],
      },
    ])
    .disabled(false)
    .omitted(false)
    .linkType("Entry");

  story
    .createField("displayOrder")
    .name("Display order")
    .type("Boolean")
    .localized(false)
    .required(true)
    .validations([])
    .disabled(false)
    .omitted(false);
  story.changeFieldControl("title", "builtin", "singleLine", {});
  story.changeFieldControl("storyBody", "builtin", "markdown", {});
  story.changeFieldControl("media", "builtin", "assetLinkEditor", {});
  story.changeFieldControl("storyLinkText", "builtin", "singleLine", {});
  story.changeFieldControl("storyPage", "builtin", "entryLinkEditor", {});

  story.changeFieldControl("displayOrder", "builtin", "boolean", {
    trueLabel: "Image on left",
    falseLabel: "Image on right",
  });

  const advice = migration
    .createContentType("advice")
    .name("Advice")
    .description("")
    .displayField("title");

  advice
    .createField("title")
    .name("Title")
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

  advice
    .createField("adviceBody")
    .name("Advice body")
    .type("Text")
    .localized(false)
    .required(true)
    .validations([])
    .disabled(false)
    .omitted(false);
  advice
    .createField("media")
    .name("Media")
    .type("Link")
    .localized(false)
    .required(false)
    .validations([])
    .disabled(false)
    .omitted(false)
    .linkType("Asset");
  advice
    .createField("displayOrder")
    .name("Display order")
    .type("Boolean")
    .localized(false)
    .required(true)
    .validations([])
    .disabled(false)
    .omitted(false);
  advice
    .createField("applyBackgroundColor")
    .name("Apply background color")
    .type("Boolean")
    .localized(false)
    .required(false)
    .validations([])
    .disabled(false)
    .omitted(false);
  advice
    .createField("showTitle")
    .name("Show title")
    .type("Boolean")
    .localized(false)
    .required(true)
    .validations([])
    .disabled(false)
    .omitted(false);
  advice.changeFieldControl("title", "builtin", "singleLine", {});
  advice.changeFieldControl("adviceBody", "builtin", "markdown", {});
  advice.changeFieldControl("media", "builtin", "assetLinkEditor", {});

  advice.changeFieldControl("displayOrder", "builtin", "boolean", {
    trueLabel: "Image on left",
    falseLabel: "Image on right",
  });

  advice.changeFieldControl("applyBackgroundColor", "builtin", "boolean", {});
  advice.changeFieldControl("showTitle", "builtin", "boolean", {});
  const tableOfContents = migration
    .createContentType("tableOfContents")
    .name("Table of contents")
    .description("")
    .displayField("title");

  tableOfContents
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

  tableOfContents.changeFieldControl("title", "builtin", "singleLine", {});
  const information = migration
    .createContentType("information")
    .name("Summary")
    .description("")
    .displayField("title");

  information
    .createField("title")
    .name("Title")
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

  information
    .createField("informationBody")
    .name("Information body")
    .type("Text")
    .localized(false)
    .required(true)
    .validations([])
    .disabled(false)
    .omitted(false);
  information
    .createField("icon")
    .name("Icon")
    .type("Link")
    .localized(false)
    .required(false)
    .validations([])
    .disabled(false)
    .omitted(false)
    .linkType("Asset");

  information
    .createField("callToAction")
    .name("Call to action")
    .type("Link")
    .localized(false)
    .required(false)
    .validations([
      {
        linkContentType: ["callToAction"],
      },
    ])
    .disabled(false)
    .omitted(false)
    .linkType("Entry");

  information.changeFieldControl("title", "builtin", "singleLine", {});
  information.changeFieldControl("informationBody", "builtin", "markdown", {});
  information.changeFieldControl("icon", "builtin", "assetLinkEditor", {});
  information.changeFieldControl(
    "callToAction",
    "builtin",
    "entryLinkEditor",
    {}
  );
  const userJourney = migration
    .createContentType("userJourney")
    .name("Steps")
    .description("")
    .displayField("title");

  userJourney
    .createField("title")
    .name("Title")
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

  userJourney
    .createField("steps")
    .name("Steps")
    .type("Array")
    .localized(false)
    .required(true)
    .validations([])
    .disabled(false)
    .omitted(false)
    .items({
      type: "Link",

      validations: [
        {
          linkContentType: ["advice"],
        },
      ],

      linkType: "Entry",
    });

  userJourney
    .createField("isAccordion")
    .name("Is Accordion")
    .type("Boolean")
    .localized(false)
    .required(true)
    .validations([])
    .disabled(false)
    .omitted(false);
  userJourney.changeFieldControl("title", "builtin", "singleLine", {});
  userJourney.changeFieldControl("steps", "builtin", "entryLinksEditor", {});
  userJourney.changeFieldControl("isAccordion", "builtin", "boolean", {});
  const question = migration
    .createContentType("question")
    .name("Question")
    .description("")
    .displayField("questionText");

  question
    .createField("questionText")
    .name("QuestionText")
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

  question
    .createField("subText")
    .name("Sub text")
    .type("Text")
    .localized(false)
    .required(false)
    .validations([])
    .disabled(false)
    .omitted(false);

  question
    .createField("renderAs")
    .name("Render as")
    .type("Array")
    .localized(false)
    .required(true)
    .validations([
      {
        size: {
          min: 1,
          max: 1,
        },
      },
    ])
    .disabled(false)
    .omitted(false)
    .items({
      type: "Symbol",

      validations: [
        {
          in: ["Dropdown", "Radio button"],
        },
      ],
    });

  question
    .createField("answers")
    .name("Answers")
    .type("Array")
    .localized(false)
    .required(true)
    .validations([
      {
        size: {
          min: 2,
        },
      },
    ])
    .disabled(false)
    .omitted(false)
    .items({
      type: "Link",

      validations: [
        {
          linkContentType: ["answer"],
        },
      ],

      linkType: "Entry",
    });

  question.changeFieldControl("questionText", "builtin", "singleLine", {});
  question.changeFieldControl("subText", "builtin", "markdown", {});
  question.changeFieldControl("renderAs", "builtin", "checkbox", {});
  question.changeFieldControl("answers", "builtin", "entryLinksEditor", {});
  const navLink = migration
    .createContentType("navLink")
    .name("Nav Link")
    .description("")
    .displayField("title");

  navLink
    .createField("title")
    .name("Title")
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

  navLink
    .createField("links")
    .name("Links")
    .type("Array")
    .localized(false)
    .required(true)
    .validations([])
    .disabled(false)
    .omitted(false)
    .items({
      type: "Link",

      validations: [
        {
          linkContentType: ["page"],
        },
      ],

      linkType: "Entry",
    });

  navLink.changeFieldControl("title", "builtin", "singleLine", {});
  navLink.changeFieldControl("links", "builtin", "entryLinksEditor", {});
  const navigation = migration
    .createContentType("navigation")
    .name("Navigation")
    .description("")
    .displayField("title");

  navigation
    .createField("title")
    .name("Title")
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

  navigation
    .createField("pages")
    .name("Pages")
    .type("Array")
    .localized(false)
    .required(true)
    .validations([])
    .disabled(false)
    .omitted(false)
    .items({
      type: "Link",

      validations: [
        {
          linkContentType: ["navLink", "page"],
        },
      ],

      linkType: "Entry",
    });

  navigation
    .createField("callToActions")
    .name("Call to actions")
    .type("Array")
    .localized(false)
    .required(false)
    .validations([])
    .disabled(false)
    .omitted(false)
    .items({
      type: "Link",

      validations: [
        {
          linkContentType: ["callToAction"],
        },
      ],

      linkType: "Entry",
    });

  navigation.changeFieldControl("title", "builtin", "singleLine", {});
  navigation.changeFieldControl("pages", "builtin", "entryLinksEditor", {});
  navigation.changeFieldControl(
    "callToActions",
    "builtin",
    "entryLinksEditor",
    {}
  );
  const heroBanner = migration
    .createContentType("heroBanner")
    .name("Hero banner")
    .description("")
    .displayField("title");

  heroBanner
    .createField("title")
    .name("Title")
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

  heroBanner
    .createField("heroText")
    .name("Hero text")
    .type("Text")
    .localized(false)
    .required(false)
    .validations([])
    .disabled(false)
    .omitted(false);
  heroBanner
    .createField("heroMedia")
    .name("Hero media")
    .type("Link")
    .localized(false)
    .required(true)
    .validations([])
    .disabled(false)
    .omitted(false)
    .linkType("Asset");
  heroBanner
    .createField("isTextBordered")
    .name("Is text bordered")
    .type("Boolean")
    .localized(false)
    .required(true)
    .validations([])
    .disabled(false)
    .omitted(false);
  heroBanner
    .createField("displayOrder")
    .name("Display order")
    .type("Boolean")
    .localized(false)
    .required(false)
    .validations([])
    .disabled(false)
    .omitted(false);
  heroBanner.changeFieldControl("title", "builtin", "singleLine", {});
  heroBanner.changeFieldControl("heroText", "builtin", "markdown", {});
  heroBanner.changeFieldControl("heroMedia", "builtin", "assetLinkEditor", {});
  heroBanner.changeFieldControl("isTextBordered", "builtin", "boolean", {});

  heroBanner.changeFieldControl("displayOrder", "builtin", "boolean", {
    trueLabel: "Image on left",
    falseLabel: "Image on right",
  });

  const callToAction = migration
    .createContentType("callToAction")
    .name("Call To Action")
    .description("")
    .displayField("title");

  callToAction
    .createField("title")
    .name("Title")
    .type("Symbol")
    .localized(false)
    .required(true)
    .validations([
      {
        unique: true,
      },
      {
        size: {
          max: 50,
        },
      },
    ])
    .disabled(false)
    .omitted(false);

  callToAction
    .createField("slug")
    .name("Slug")
    .type("Symbol")
    .localized(false)
    .required(false)
    .validations([])
    .disabled(false)
    .omitted(false);

  callToAction
    .createField("ctaType")
    .name("CTA Type")
    .type("Text")
    .localized(false)
    .required(true)
    .validations([
      {
        in: ["Primary", "Secondary", "Start", "Warning"],
      },
    ])
    .disabled(false)
    .omitted(false);

  callToAction.changeFieldControl("title", "builtin", "singleLine", {});
  callToAction.changeFieldControl("slug", "builtin", "singleLine", {});
  callToAction.changeFieldControl("ctaType", "builtin", "radio", {});
  const answer = migration
    .createContentType("answer")
    .name("Answer")
    .description("")
    .displayField("answer");

  answer
    .createField("answer")
    .name("Answer")
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

  answer
    .createField("link")
    .name("Link")
    .type("Link")
    .localized(false)
    .required(false)
    .validations([
      {
        linkContentType: ["page"],
      },
    ])
    .disabled(false)
    .omitted(false)
    .linkType("Entry");

  answer.changeFieldControl("answer", "builtin", "singleLine", {});
  answer.changeFieldControl("link", "builtin", "entryLinkEditor", {});
  const columnarLayout = migration
    .createContentType("columnarLayout")
    .name("Columnar Layout")
    .description("")
    .displayField("title");

  columnarLayout
    .createField("title")
    .name("Title")
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

  columnarLayout
    .createField("blocks")
    .name("Blocks")
    .type("Array")
    .localized(false)
    .required(false)
    .validations([])
    .disabled(false)
    .omitted(false)
    .items({
      type: "Link",
      validations: [],
      linkType: "Entry",
    });

  columnarLayout.changeFieldControl("title", "builtin", "singleLine", {});
  columnarLayout.changeFieldControl(
    "blocks",
    "builtin",
    "entryLinksEditor",
    {}
  );
};
