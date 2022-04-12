const planDao = require('../dao/plan');
const formatDate = require('../utils/format_date');
const ServiceResult = require('./service_result');
const apiError = require('../error/api_error');
const errorCode = require('../error/error_code');

const createPlan = async ({
  userId,
  name,
  sumCost,
  sumCurrentMoney,
  expectedFinishDate,
  lastUpdateDate,
  status,
}) => {
  const expectedFinishDateFormated = formatDate.format(expectedFinishDate);
  const lastUpdateDateFormated = formatDate.format(lastUpdateDate);
  const newPlan = {
    userId: userId,
    name: name,
    sumCost: sumCost,
    sumCurrentMoney: sumCurrentMoney,
    expectedFinishDate: expectedFinishDateFormated,
    lastUpdateDate: lastUpdateDateFormated,
    status: status,
  };
  const plan = await planDao.createPlan({newPlan});
  if (!plan) {
    return new ServiceResult({
      apiError: apiError.createApiError(errorCode.CREATE_PLAN_FAILED),
      data: {plan},
    }); 
  };
  return new ServiceResult({
    apiError: apiError.createApiError(errorCode.CREATE_PLAN_SUCCESS),
    data: { plan },
  });
};

const getListPlanByIdStatus = async ({
  userId,
  status,
}) => {
  const plans = await planDao.getListPlanByIdStatus({userId, status});
  if (!plans) {
    return new ({
      apiError: apiError.createApiError(errorCode.NOT_GET_LIST_PLAN),
      data: {plans},
    });
  }
  return new ServiceResult({
    apiError: apiError.createApiError(errorCode.GET_LIST_PLAN_SUCCESS),
    data: { plans },
  });
};

const updatePlan = async (id, {
  userId,
  name,
  sumCost,
  sumCurrentMoney,
  expectedFinishDate,
  lastUpdateDate,
  status,
}) => {
  const planDb = await planDao.findPlanById(id);
  if (!planDb) {
    return new ServiceResult({
      apiError: apiError.createApiError(errorCode.NOT_FOUND_PLAN),
      data: { data },
    });
  }
  const plan = await planDao.updatePlan(userId, {
    name,
    sumCost,
    sumCurrentMoney,
    expectedFinishDate,
    lastUpdateDate,
    status
  });
  if (!plan) {
    return new ServiceResult({
      apiError: apiError.createApiError(errorCode.CREATE_PLAN_FAILED),
      data: { data },
    });
  };

  return new ServiceResult({
    apiError: apiError.createApiError(errorCode.CREATE_PLAN_SUCCESS),
    data: { data },
  });
};
module.exports = {
  createPlan,
  updatePlan,
  getListPlanByIdStatus,
}