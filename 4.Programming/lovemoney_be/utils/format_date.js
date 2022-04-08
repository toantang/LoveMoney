
const receivedDateFromFrontEnd = 'yyyy-mm-ddT17:hh:mm:sssZ';
const defaultFormatDate = 'yyyy-mm-dd';

const setDefault = date => {
  if (date == undefined || date == null) {
    return null;
  }
  const newDate = new Date(date);
  newDate.setMilliseconds(0);
  newDate.setSeconds(0);
  newDate.setMinutes(0);
  newDate.setHours(0);
  return newDate;
};

const format = day => {
  const stringFormated = dateToString(day);
  if (stringFormated == null) {
    console.log('dateToString is null');
    return null;
  }
  return new Date(stringFormated);
}

const dateToString = day => {
  if (day == null || day == undefined) {
    console.log('day is null');
    return null;
  }
  var convertDay = null;
  try {
    convertDay = new Date(day);
  } catch (error) {
    console.log(error);
    return null;
  }

  if (convertDay instanceof Date) {
    const date = convertDay.getDate();
    const month = convertDay.getMonth() + 1;
    const year = convertDay.getFullYear();

    var dateString = date.toString();
    var monthString = month.toString();
    dateString = dateString.length < 2 ? '0' + dateString : dateString;
    monthString = monthString.length < 2 ? '0' + monthString : monthString;

    const yearString = year.toString();
    const dayString = yearString + '-' + monthString + '-' + dateString;
    return dayString;
  }
  return null;
};

module.exports = {
    format,
    setDefault,
    dateToString,
}
