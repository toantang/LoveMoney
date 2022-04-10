const User = require('../models/user');

const findUserByEmail = async ({email}) => {
  const lowerEmail = email.toLowerCase();
  const user = await User.findOne({email: lowerEmail});
  if (user) {
    return user;
  }
  return null;
};

const updateInfo = async ({
  email,
  hashPassword,
  name,
  bio,
  gender,
}) => {
  const userDb = await findUserByEmail({email});
  const id = userDb.id;
  const user = await User.findByIdAndUpdate(
      {
        _id: id,
      },
      {
        hashPassword,
        name,
        bio,
        gender,
      },
      {new: true, runValidators: true},
  );
  
  return user;
};
module.exports = {
  findUserByEmail,
  updateInfo,
}