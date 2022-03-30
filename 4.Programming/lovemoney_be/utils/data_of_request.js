const checkBody = function bodyIsEmpty(body) {
    if (Object.keys(body).length === 0) {
        return true; // body is empty
    }
    return false;
}

const getDataFromRequest = function getData(request) {
    if (checkBody(request.body)) {
        return request.query;
    }
    else {
        return request.body;
    }
}
module.exports = {
    checkBody,
    getDataFromRequest, 
}