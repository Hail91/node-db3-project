const db = require('../data/db-config');

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
};

// GET - Get list of all schemes from the database
function find() {
    return db.select('*').from('schemes');
};

// GET - Get a scheme by ID from the database
function findById(id) {
    return db.select('*').from('schemes').where({ id });
};

function findSteps(id) {
    return db('schemes as s')
    .join('steps as st', 's.id', 'st.scheme_id')
    .select('s.id', 's.scheme_name', 'st.step_number', 'st.instructions')
    .where('s.id', id)
    .orderBy('st.step_number', 'asc');
}

function add(scheme) {
    return db('schemes').insert(scheme)
    .then(([id]) => {
        return findById(id)
    });
};

function update(newScheme, id) {
    return db('schemes').where({ id }).update(newScheme)
    .then(newScheme => {
        return newScheme
    });
};

function remove(id) {
    return db('schemes').where({ id }).del()
};



