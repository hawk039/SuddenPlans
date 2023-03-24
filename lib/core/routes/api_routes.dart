class ApiRoutes {
  ApiRoutes._();

  static const viralityMainUrl = "https://virality-be.antino.ca";

  // static const viralityMainUrl = "https://474f-49-249-44-114.in.ngrok.io";

  static const viarlityTestUrl = "http://virality-dev-test.antino.ca";

  static const sphMainUrl = 'https://crossmediaapi.virality-media.com/';
  static const sphInternal = 'https://crossmedia-internal.antino.ca/';

//*  ----------- main urls settings ----------- *

// -- production main urls.
  // static const sphBaseUrl = sphMainUrl;
  // static var mainUrl = viralityMainUrl + '/api/v1/';

  static String sphBaseUrl = "";
  static String mainUrl = "";

//* ----------- main urls settings ----------- *

  static var sendOtpUrl = '${mainUrl}otp/sendOtp';
  static var restOtpUrl = '${mainUrl}otp/resetOtp';
  static var verifyOtpUrl = '${mainUrl}otp/verifyOtp';
  static var loginUrl = '${mainUrl}user/userLogin';

  ///Chat Module
  static var videoCallUrl = '${mainUrl}calls/videoCall';
  static var rejectVideoCallUrl = '${mainUrl}calls/reject';
  static var initiateMessageNotification = '${mainUrl}chat/chatnotify';

  // users
  static var createUserUrl = '${mainUrl}user/create_user';
  static var updateUserUrl = '${mainUrl}user/updateUser';
  static var getInterestedTagsUrl = '${mainUrl}intrest/getAllIntrest';
  static var userExistCheck = '${mainUrl}user/googleLogin';
  static var getUserDetailUrl = '${mainUrl}user/userDetails';

  static var singleImageUploadUrl = '${mainUrl}s3/uploadOne';
  static var multiImageUploadUrl = '${mainUrl}s3/uploadMany';
  static var multiImageUploadUrl2 = '${mainUrl}s3/uploadMultipleFiles';

  static var createNewPasswordUrl = '${mainUrl}user/resetPassword';
  static var changePasswordUrl = '${mainUrl}user/changePassword';
  static var userNameGenerateUrl = '${mainUrl}user/generateUserName';
  static var addDeviceToken = '${mainUrl}notification/registerDeviceToken';
  static var removeDeviceToken = '${mainUrl}notification/removeToken';

  static var updateWalletPostUrl = '${mainUrl}wallet/updateWallet';
  static var postTrackingPostUrl = '${mainUrl}campaignPosts/postTracking';

  // campaigns
  static var getAllCampaigns = '${mainUrl}campaigns/getAll';
  static var getBrandCampaignsUrl = '${mainUrl}campaigns/getAllCampaignByBrand';
  static var createCampaign = '${mainUrl}campaigns/create';
  static var likeCampaignUrl = '${mainUrl}campaigns/likeUnlikeCampaigns';
  static var getCampaignByIdUrl = '${mainUrl}campaigns/getCampaignDetails';

  static var getUsersJoinedCampaignsUrl = '${mainUrl}campaigns/userCampaigns';
  static var deleteCampaignsUrl = '${mainUrl}campaigns/deleteCampaign';
  static var editCampaignUrl = '${mainUrl}campaigns/editCampaign';

  //influencer
  static var getAllInfluencers = '${mainUrl}campaigns/listGetAllUserList';
  static var likeUnlikeInfluencerUrl = '${mainUrl}campaigns/likeUnlike';
  static var getFavouritesInfUrl = '${mainUrl}campaigns/listAllFavourite';
  static var searchInterestUrl = '${mainUrl}campaigns/searchIntrest';

  // collaborators
  static var getCollaborationsRequestUrl = '${mainUrl}campaigns/getAllRequest';
  static var getCampaignCollaborators = '${mainUrl}campaigns/getAllcolabs';
  static var approvRejectCollabUrl = '${mainUrl}collabs/approve';
  static var joinCampaignUrl = '${mainUrl}collabs/joinCampaign';

  //payments
  static var paymentOrderUrl = '${mainUrl}payments/payOrder';
  static var paymentCaptureUrl = '${mainUrl}payments/payCapture';
  static var transactionListUrl = '${mainUrl}payments/list';
  static var paymentWithdraw = '${mainUrl}payments/payOut';

  //others
  static var getWalletUrl = '${mainUrl}wallet/getUserWallet';
  static var getNotificationsUrl = '${mainUrl}activity/getAllActivity';
  static var deleteNotificationUrl = '${mainUrl}activity/deleteActivity';
  static var updateNotificationsUrl = '${mainUrl}activity/updateAllActivity';
  static var getPostTrackingUrl = '${mainUrl}campaignPosts/getPostTracking';

  static var updateSphUrl = '${mainUrl}user/addUserOnSphDatabase';

  // ------------- SPH URLS -----------------------------------
  static var getInstagramLoginUrl = sphBaseUrl + 'getLoginUrl/';
  static var addInstagramAccount = sphBaseUrl + 'addInstagramAccount/';

  static var getLinkedLoginUrl = sphBaseUrl + 'linkedin/login_url/';
  static var addLinkedAccountUrl = sphBaseUrl + 'linkedin/add_account/';

  static var getFacebookLoginUrl = sphBaseUrl + 'facebook/login_url/';
  static var addFacebookPageUrl = sphBaseUrl + 'facebook/facebook_pages/';

  static var postToS3 = "${mainUrl}s3/uploadOne?userId=1234&type=image";

  static var postImageToInstagram = '${sphBaseUrl}postImg/';
  static var postVideoToInstagram = '${sphBaseUrl}postVid/';
  static var postReelsToInstagram = '${sphBaseUrl}postReels/';

  static var postVideoToYoutube = '${sphBaseUrl}postYTVideo/';

  static var postMessageToLinkedIn = '${sphBaseUrl}linkedin/post_message/';
  static var postImageToLinkedIn = '${sphBaseUrl}linkedin/post_img_api/';
  static var postVideoToLinkedIn = '${sphBaseUrl}linkedin/post_vid_api/';
  static var postImageWithLinkToLinkedIn =
      '${sphBaseUrl}linkedin/post_link_image/';

  static var postImageToFacebookUrl =
      '${sphBaseUrl}facebook/post_images_to_page/';
  static var postVideoToFacebookUrl =
      '${sphBaseUrl}facebook/post_videos_to_page/';

  static var getAccountPostsUrl = '${sphBaseUrl}accountinfo/';

  static var postsFromSocialmediaIdUrl = '${sphBaseUrl}userposts/';
  static var removeSocialMediaAccount =
      '${sphBaseUrl}deleteSocialMediaDetails/';

  static var musicTokenUrl = "${mainUrl}music/getMusicToken";
  static var musicSearch = "${sphBaseUrl}music/fs_search_music/";
  static var musicDetails = "${sphBaseUrl}music/fs_music_details/";

  //youtube
  static var getYoutubeLoginUrl = '${sphBaseUrl}getYTLoginUrl/';
  static var addYtAccountUrl = '${sphBaseUrl}add_yt_account/';

  //tiktok
  static var getTiktokLoginUrl = '${sphBaseUrl}tiktok/login_url/';
  static var addTikTokUrl = '${sphBaseUrl}tiktok/add_account/';
  static var postVideoTiktok = '${sphBaseUrl}tiktok/tiktokVideoUpload/';

  //twitter
  static var getTwitterLogin = '${sphBaseUrl}twitter/login_url/';
  static var addTwitterUrl = '${sphBaseUrl}twitter/add_account/';
  static var postImageTwitterUrl = '${sphBaseUrl}twitter/postTweet_Image/';
  static var postVideoTwitterUrl = '${sphBaseUrl}twitter/postTweet_Video/';

  //get post apis.
  // static var getRecentPostUrl = '${sphBaseUrl}recent_posts/';
  // static var getPostByDateUrl = '${sphBaseUrl}posts_by_date/';

//-------- new updates -----
  static var getRecentPostUrlNew = '${sphBaseUrl}recent_post_details/';
  static var getSchedulePostUrlNew = '${sphBaseUrl}scheduled_post_details/';
  static var getPostAnalytics = '${sphBaseUrl}post_analytics/';

  static var getPostByDateUrlNew = '${sphBaseUrl}posts_info_by_date/';
  static var postByDateRangeUrlNew = '${sphBaseUrl}posts_date_range/';

//-------- new updates ----- x

  // static var postByDateRangeUrl = '${sphBaseUrl}posts_by_date_range/';
  // static var getScheduledPostUrl = '${sphBaseUrl}scheduled_posts/';

  static var getYouTube = "$sphBaseUrl/postYTVideo/";

  //account profile apis.
  static var getSocialAccountsUrl = '${sphBaseUrl}social_media_accounts/';
  static var getProfileAnalytcsUrl = '${sphBaseUrl}profile_analytics/';
  static var getProfileOverviewUrl = '${sphBaseUrl}profile_overview/';
}
