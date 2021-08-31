module.exports = function (migration) {
    const page = migration.editContentType('page');
    page.moveField('navTitle').afterField('title');

    migration.transformEntries({
        contentType: 'page',
        from: ['title'],
        to: ['navTitle'],
        transformEntryForLocale: function (fromFields, currentLocale) {
            return { navTitle: fromFields.title[currentLocale] };
        }
    });
};