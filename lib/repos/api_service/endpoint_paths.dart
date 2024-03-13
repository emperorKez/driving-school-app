class ApiPaths {
  static const registerUser = 'user/register';

  //schedule flow
  static String getScheduleFlowWithId(String id) => 'scheduleFlow/$id';
  static String updateScheduleFlowWithId(String id) => 'scheduleFlow/$id';
  static String deleteScheduleFlowWithId(String id) => 'scheduleFlow/$id';
  static const getAllScheduleFlows = 'scheduleFlow';
  static const createNewScheduleFlow = 'scheduleFlow';

  //language
  // static String getLanguageWithId(String id) => 'language/$id';
  // static String updateLanguageWithId(String id) => 'language/$id';
  // static String deleteLanguageWithId(String id) => 'language/$id';
  static const getAllLanguages = 'metadata/language';
  // static const createNewLanguage = '/metadata/language';

  //courseCategory
  static String getCourseCategoryWithId(String id) => 'courseCategory/$id';
  static String updateCourseCategoryWithId(String id) => 'courseCategory/$id';
  static String deleteCourseCategoryWithId(String id) => 'courseCategory/$id';
  static const getAllCourseCategorys = 'courseCategory';
  static const createNewCourseCategory = 'courseCategory';

  //city
  static String getCityWithId(String id) => 'city/$id';
  static String updateCityWithId(String id) => 'city/$id';
  static String deleteCityWithId(String id) => 'city/$id';
  static const getAllCitys = 'city';
  static const createNewCity = 'city';

  //advertisement
  static String getAdWithId(String id) => 'advertisement/$id';
  static String updateAdWithId(String id) => 'advertisement/$id';
  static const getAllAds = 'advertisement';
  static const createNewAd = 'advertisement';

  //storage
  static const uploadFile = 'storage/upload';

  //logo
  static String getLogoWithId(String id) => 'logo/$id';
  static const createNewLogo = 'logo';

  //userRole
  static const getAllUserRoles = 'userRole';

  //transmission types
  static const getAllTransmissionTypes = 'transmissionType';

  //get all questions
  static const getAllQuestions = 'question';

  //helpTopic
  static const getAllHelpTopics = '/metadata/help-topics';

  //feedbackCategory
  static const getAllAppFeedbackCategories = 'metadata/feedback-categories';

  //subscriptionItem
  static String getSubscriptionItemWithId(String id) => 'subscriptionItem/$id';
  static String updateSubscriptionItemWithId(String id) =>
      'subscriptionItem/$id';
  static String deleteSubscriptionItemWithId(String id) =>
      'subscriptionItem/$id';
  static const getAllSubscriptionItems = 'subscriptionItem';
  static const createNewSubscriptionItem = 'subscriptionItem';

  //subscriptionLevel item
  static String getSubLevelItemByid(String subId, String itemId) =>
      'subscriptionLevel/$subId/item/$itemId';
  static String updateSubLevelItemByid(String subId, String itemId) =>
      'subscriptionLevel/$subId/item/$itemId';
  static String deleteSubLevelItemByid(String subId, String itemId) =>
      'subscriptionLevel/$subId/item/$itemId';
  static String getSublevel(String id) => 'subscriptionLevel/$id';
  static String updateSublevel(String id) => 'subscriptionLevel/$id';
  static String deleteSublevel(String id) => 'subscriptionLevel/$id';
  static const getAllSublevels = 'subscriptionLevel';
  static const createSublevel = 'subscriptionLevel';
  static String getAllSublevelItems(String levelId) =>
      'subscriptionLevel/$levelId/item';
  static String createNewSublevelItem(String levelId) =>
      'subscriptionLevel/$levelId/item';

  //school
  static const getAllSchools = 'school';
  static const createNewSchool = 'school';
  static String getSchoolById(String id) => 'school/$id';
  static String updateSchoolById(String id) => 'school/$id';
  static String deleteSchoolById(String id) => 'school/$id';

  //driving school page info
  static String getDrivingSchoolPageInfo(String schoolId) =>
      'school/$schoolId/get-driving-school-page';

  //instructor
  static String getInstructorsOfSchool(String schoolId) =>
      'school/$schoolId/instructor';
  static String createNewInstructorForSchool(String schoolId) =>
      'school/$schoolId/instructor';

  //package
  static String getPackagesOfSchool(String schoolId) =>
      'school/$schoolId/package';
  static String addPackageForSchool(String schoolId) =>
      'school/$schoolId/package';
  static String updatePackageById(String schoolId, String packageId) =>
      'school/$schoolId/package/$packageId';
  static String deletePackageById(String schoolId, String aId) =>
      'school/$schoolId/package/$aId';

  //availabilityException
  static String getAvailabilityExceptionById(String schoolId, String id) =>
      'school/$schoolId/availabilityException/$id';
  static String updateAvailabilityExceptionById(String schoolId, String id) =>
      'school/$schoolId/availabilityException/$id';
  static String deleteAvailabilityExceptionById(String schoolId, String id) =>
      'school/$schoolId/availabilityException/$id';
  static String getAvailabilityExceptionsOfSchool(String schoolId) =>
      'school/$schoolId/availabilityException';
  static String addAvailabilityExceptionForSchool(String schoolId) =>
      'school/$schoolId/availabilityException';

  //vehicle
  static String getVehiclesOfSchool(String schoolId) =>
      'school/$schoolId/vehicle';
  static String addVehiclesForSchool(String schoolId) =>
      'school/$schoolId/vehicle';

  //instructor
  static String getInstructorById(String schoolId, String iId) =>
      'school/$schoolId/instructor/$iId';
  static String updateInstructorById(String schoolId, String iId) =>
      'school/$schoolId/instructor/$iId';
  static String deleteInstructorById(String schoolId, String iId) =>
      'school/$schoolId/instructor/$iId';

  //availableDate
  static String updateAvailableDateId(String schoolId, String aId) =>
      'school/$schoolId/availableDates/$aId';
  static String deleteAvailableDateId(String schoolId, String aId) =>
      'school/$schoolId/availableDates/$aId';
  static String addAvailableDateForSchool(String schoolId) =>
      'school/$schoolId/availableDates';
  static String getAvailableDatesForSchool(String schoolId) =>
      'school/$schoolId/availableDates';

  //group lesson
  static String getGroupLessonById(String schoolId, String aId) =>
      'school/$schoolId/groupLesson/$aId';
  static String updateGroupLessonById(String schoolId, String aId) =>
      'school/$schoolId/groupLesson/$aId';
  static String deleteGroupLessonById(String schoolId, String aId) =>
      'school/$schoolId/groupLesson/$aId';
  static String addGroupLessonForSchool(String schoolId) =>
      'school/$schoolId/groupLesson';
  static String getGroupLessonsOfSchool(String schoolId) =>
      'school/$schoolId/groupLesson';

  //group lesson
  static String updateCourse(int schoolId, String courseId) =>
      'school/$schoolId/course/$courseId';
  static String getCourse(int schoolId, String aId) =>
      'school/$schoolId/course/$aId';
  static String deleteCourse(int schoolId, String aId) =>
      'school/$schoolId/course/$aId';
  static String addCourse(int schoolId) =>
      'school/$schoolId/course';
  static String getCourses(int schoolId) =>
      'school/$schoolId/course';

  //pickup location
  static String getPickupLocationById(String schoolId, String aId) =>
      'school/$schoolId/pickupLocation/$aId';
  static String updatePickupLocationById(String schoolId, String aId) =>
      'school/$schoolId/pickupLocation/$aId';
  static String deletePickupLocationById(String schoolId, String aId) =>
      'school/$schoolId/pickupLocation/$aId';
  static String getPickupLocationOfSchool(String schoolId) =>
      'school/$schoolId/pickupLocation';
  static String addPickupLocationForSchool(String schoolId) =>
      'school/$schoolId/pickupLocation';
  static String updatePickupLocationStatus(String schoolId, String aId) =>
      'school/$schoolId/pickupLocation/$aId/status';

  //promotion
  static String getPromotion(int schoolId, int promotionId) =>
      'school/$schoolId/promotion/$promotionId';
  static String updatePromotion(int schoolId, int promotionId) =>
      'school/$schoolId/promotion/$promotionId';
  static String deletePromotion(int schoolId, int promotionId) =>
      'school/$schoolId/promotion/$promotionId';
  static String getAllPromotion(
    int schoolId,
  ) =>
      'school/$schoolId/promotion';
  static String addPromotion(
    int schoolId,
  ) =>
      'school/$schoolId/promotion';

  //review
  static String updateReviewById(String schoolId, String aId) =>
      'school/$schoolId/review/$aId';
  static String deleteReviewById(String schoolId, String aId) =>
      'school/$schoolId/review/$aId';
  static String getReviewsOfSchool(String schoolId) =>
      'school/$schoolId/review';
  static String addReviewForSchool(String schoolId) =>
      'school/$schoolId/review';

  //vehicle
  static String updateVechileById(String schoolId, String aId) =>
      'school/$schoolId/vehicle/$aId';
  static String getVechileById(String schoolId, String aId) =>
      'school/$schoolId/vehicle/$aId';
  static String deleteVechileById(String schoolId, String aId) =>
      'school/$schoolId/vehicle/$aId';

  //students
  static String getStudents = 'student/by-school';
  static String createStudents = 'student';
  static String getStudentById(int studentId) => 'sudent/$studentId';
  static String updateStudent(int studentId) => 'sudent/$studentId';
  static String archivetudent(int studentId) => 'sudent/$studentId';
  static String updateStudentAvatar(int studentId) =>
      'sudent/$studentId/avatar';
  static String declineStudent(int studentId) =>
      'sudent/$studentId/decline-to-school';
  static String approveStudent(int studentId, int schoolId) =>
      'sudent/$studentId/approve-to-school/$schoolId';

  //staff
  static String getAllStaffRoles = 'metadata/staff-roles';
  static String getStaffbyEmail = 'staff';
  static String createStaff = 'staff';
  static String getStaffSchoolInvite = 'staff/pending-school-invite';
  static String getStaffBySchool = 'staff/by-school';

  //location
  static String suggestLocation = 'location/suggest';
  static String getLocationType = 'metadata/location-type';

//Vehicle Transmission Types
  static String getVehicleTransmissionTypes = '/metadata/transmission-type';

//Schedule Flow
  static String getScheduleFlow = '/metadata/schedule-flow';

//document type
  static String getAllDocumentType = 'metadata/document-type';

//instructor selection types
  static String getAllinstructorSelectionType = 'metadata/instructor-selection';

//course categories
  static String getAllCourseCategories = 'metadata/course-categories';
}
