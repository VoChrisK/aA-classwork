const formData = $(".follow-toggle").serialize();
const APIUtil = {
  followUser: id => {
    return $.ajax({
      url: `/users/${id}/follow`,
      type: 'POST',
      data: formData,
      dataType: 'JSON'
    });
  },

  unfollowUser: id => {
    return $.ajax({
      url: `/users/${id}/follow`,
      type: 'DELETE',
      data: formData,
      dataType: 'JSON'
    });
  },

  searchUsers: queryVal =>{
    return $.ajax({
      url: `/users/search`,
      type: 'DELETE',
      data: formData,
      dataType: 'JSON'
    });
  }
};

module.exports = APIUtil;