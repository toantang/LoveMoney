const USER_ROLE_NAME = {
    STUDENT : 'Student',
    SINGLE : 'Single',
    NORMAL_PERSON : 'Normal_person',
};

const USER_ROLE_TYPE = {
    USER: "User",
    ADMIN: 'Admin',
}
const TYPE_TRANSACTION = {
    EXPENSE_TRANSACTION: "Expense",
    TURNOVER_TRANSACTION: 'Turnover',
};

const TYPE_TRANSACTION_PART = {
    FIXED_TRANSACTION: 'Fixed', 
    VARIABLE_TRANSACTION: 'Variable',
}

module.exports = {
    USER_ROLE_NAME,
    USER_ROLE_TYPE,
    TYPE_TRANSACTION,
    TYPE_TRANSACTION_PART,
}