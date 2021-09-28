module.exports = function (migration) {
    const page = migration.editContentType('page');
    page.moveField('navTitle').afterField('title');
};