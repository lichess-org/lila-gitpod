// View test users that were seeded in the database
// Usage: mongosh lichess --quiet --file users.js

let users = db.user4
    .find()
    .toArray()
    .map((user) => {
        return {
            id: user._id,
            roles: user.roles.join(', '),
            title: user.title || null,
            marks: user.marks.join(', '),
        }
    })

console.log('Special User Accounts')
console.table(users.filter((user) => user.roles))

console.log('Marked Accounts')
console.table(users.filter((user) => user.marks))

console.log('Regular Accounts')
console.table(users.filter((user) => !user.roles && !user.marks))
