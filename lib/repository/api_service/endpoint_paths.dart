class ApiPaths {
  static const registerUser = 'user/register';

  //schedule flow
  static String getScheduleFlowWithId(int id) => 'scheduleFlow/$id';
  static String updateScheduleFlowWithId(int id) => 'scheduleFlow/$id';
  static String deleteScheduleFlowWithId(int id) => 'scheduleFlow/$id';
  static const getAllScheduleFlows = 'scheduleFlow';
  static const createNewScheduleFlow = 'scheduleFlow';

  //language
  // static String getLanguageWithId(String id) => 'language/$id';
  // static String updateLanguageWithId(String id) => 'language/$id';
  // static String deleteLanguageWithId(String id) => 'language/$id';
  
  // static const createNewLanguage = 'metadata/language';

  //courseCategory
  static String getCourseCategoryWithId(int id) => 'courseCategory/$id';
  static String updateCourseCategoryWithId(int id) => 'courseCategory/$id';
  static String deleteCourseCategoryWithId(int id) => 'courseCategory/$id';
  static const getAllCourseCategorys = 'courseCategory';
  static const createNewCourseCategory = 'courseCategory';

  //city
  static String getCityWithId(int id) => 'city/$id';
  static String updateCityWithId(int id) => 'city/$id';
  static String deleteCityWithId(int id) => 'city/$id';
  static const getAllCitys = 'city';
  static const createNewCity = 'city';

  //advertisement
  static String getAdWithId(int id) => 'advertisement/$id';
  static String updateAdWithId(int id) => 'advertisement/$id';
  static const getAllAds = 'advertisement';
  static const createNewAd = 'advertisement';

  //storage
  static const uploadFile = 'storage/upload';

  //logo
  static String getLogoWithId(int id) => 'logo/$id';
  static const createNewLogo = 'logo';

  // //userRole
  // static const getAllUserRoles = 'userRole';

  // //transmission types
  // static const getAllTransmissionTypes = 'transmissionType';

  // //get all questions
  // static const getAllQuestions = 'question';

 

  //subscriptionItem
  static String getSubscriptionItemWithId(int id) => 'subscriptionItem/$id';
  static String updateSubscriptionItemWithId(int id) => 'subscriptionItem/$id';
  static String deleteSubscriptionItemWithId(int id) => 'subscriptionItem/$id';
  static const getAllSubscriptionItems = 'subscriptionItem';
  static const createNewSubscriptionItem = 'subscriptionItem';

  //subscriptionLevel item
  static String getSubLevelItemByid({
    required int subId,
    required int itemId,
  }) =>
      'subscriptionLevel/$subId/item/$itemId';
  static String updateSubLevelItemByid({
    required int subId,
    required int itemId,
  }) =>
      'subscriptionLevel/$subId/item/$itemId';
  static String deleteSubLevelItemByid({
    required int subId,
    required int itemId,
  }) =>
      'subscriptionLevel/$subId/item/$itemId';
  static String getSublevel(int id) => 'subscriptionLevel/$id';
  static String updateSublevel(int id) => 'subscriptionLevel/$id';
  static String deleteSublevel(int id) => 'subscriptionLevel/$id';
  static const getAllSublevels = 'subscriptionLevel';
  static const createSublevel = 'subscriptionLevel';
  static String getAllSublevelItems(int levelId) =>
      'subscriptionLevel/$levelId/item';
  static String createNewSublevelItem(int levelId) =>
      'subscriptionLevel/$levelId/item';

  //school
  static const getAllSchools = 'school';
  static const createNewSchool = 'school';
  static const validateName = 'school/validate-name';
  static String getSchool(int schoolId) => 'school/$schoolId';
  static String updateSchool(int schoolId) => 'school/$schoolId';
  static String deleteSchool(int schoolId) => 'school/$schoolId';
  static String updateSchoolConfig(int schoolId) =>
      'school/$schoolId/configurations';

  //driving school page info
  static String getDrivingSchoolPage(int schoolId) =>
      'school/$schoolId/get-driving-school-page';

  //instructor
  static String getInstructorsOfSchool(int schoolId) =>
      'school/$schoolId/instructor';
  static String createNewInstructorForSchool(int schoolId) =>
      'school/$schoolId/instructor';

  //package
  static const getPackages = 'package';
  static const addPackage = 'package';
  static String updatePackage(
    int packageId,
  ) =>
      'package/$packageId';
  static String deletePackage(
    int packageId,
  ) =>
      'package/$packageId';

  //availabilityException
  static String getAvailabilityException({
    required int schoolId,
    required int id,
  }) =>
      'school/$schoolId/availabilityException/$id';
  static String updateAvailabilityException({
    required int schoolId,
    required int id,
  }) =>
      'school/$schoolId/availabilityException/$id';
  static String deleteAvailabilityException({
    required int schoolId,
    required int id,
  }) =>
      'school/$schoolId/availabilityException/$id';
  static String getAvailabilityExceptionsOfSchool(int schoolId) =>
      'school/$schoolId/availabilityException';
  static String addAvailabilityExceptionForSchool(int schoolId) =>
      'school/$schoolId/availabilityException';

  //vehicle
  static const getVehicles = 'vehicle';
  static const addVehicle = 'vehicle';
  static String updateVehicle(int vehicleId) => 'vehicle/$vehicleId';
  static String deleteVehicle(int vehicleId) => 'vehicle/$vehicleId';

  //instructor
  static String getInstructor(
          {required int schoolId, required int instructorId,}) =>
      'school/$schoolId/instructor/$instructorId';
  static String updateInstructor({
    required int schoolId,
    required int instructorId,
  }) =>
      'school/$schoolId/instructor/$instructorId';
  static String deleteInstructor({
    required int schoolId,
    required int instructorId,
  }) =>
      'school/$schoolId/instructor/$instructorId';

  //availableDate
  static String updateAvailableDate({
    required int schoolId,
    required int aId,
  }) =>
      'school/$schoolId/availableDates/$aId';
  static String deleteAvailableDateId({
    required int schoolId,
    required int aId,
  }) =>
      'school/$schoolId/availableDates/$aId';
  static String addAvailableDateForSchool(int schoolId) =>
      'school/$schoolId/availableDates';
  static String getAvailableDatesForSchool(int schoolId) =>
      'school/$schoolId/availableDates';

  //group lesson
  static String getGroupLesson(int groupLessonId) =>
      'lesson/group/$groupLessonId';
  static String updateGroupLesson(
    int groupLessonId,
  ) =>
      'lesson/group/$groupLessonId';
  static String deleteGroupLesson(
    int groupLessonId,
  ) =>
      'lesson/group/$groupLessonId';
  static const addGroupLesson = 'lesson/group';
  static const getGroupLessons = 'lesson/group/list';
  static String addStudentToGroupLesson(
    int groupLessonId,
  ) =>
      'lesson/group/$groupLessonId/add-student';

  //course
  static String updateCourse(int courseId) => 'course/$courseId';
  static String getCourse(int courseId) => 'course/$courseId';
  static String deleteCourse(int courseId) => 'course/$courseId';
  static const addCourse = 'course';
  static const getCourses = 'course';

  //pickup location
  static String getLocation(
    int locationId,
  ) =>
      'school-location/$locationId';
  // static String updateLocation(
  //    int locationId,
  // ) =>
  //     'school-location/$locationId';
  static String deleteLocation(
    int locationId,
  ) =>
      'school-location/$locationId';
  static const getSchoolLocations = 'school-location';
  static const addLocation = 'school-location';
  static String updateLocationStatusActive(int locationId) =>
      'school-location/$locationId/active';
  static String updateLocationStatusInactive(int locationId) =>
      'school-location/$locationId/inactive';

  //promotion
  static String getPromotion(
    int promotionId,
  ) =>
      'promotion/$promotionId';
  static String updatePromotion(
    int promotionId,
  ) =>
      'promotion/$promotionId';
  static String deletePromotion(
    int promotionId,
  ) =>
      'promotion/$promotionId';
  static const getAllPromotion = 'promotion';
  static const addPromotion = 'promotion';

  //review
  static const updateReviewList = 'review/list';
  static const getReviews = 'review';
  static String disApproveReview(
    int reviewId,
  ) =>
      'review/$reviewId/disapprove';
  static String approveReview(
    int reviewId,
  ) =>
      'review/$reviewId/approve';
  static const addReview = 'review';

  //students
  static String getStudents = 'student/by-school';
  static String createStudent = 'student';
  static String getStudentById(int studentId) => 'student/$studentId';
  static String updateStudent(int studentId) => 'student/$studentId';
  static String archiveStudent(int studentId) => 'student/$studentId';
  static String updateStudentAvatar(int studentId) =>
      'student/$studentId/avatar';
  static String declineStudent(int studentId) =>
      'student/$studentId/decline-to-school';
  static String approveStudent({
    required int studentId,
    required int schoolId,
  }) =>
      'student/$studentId/approve-to-school/$schoolId';

  //staff
  static String getStaffbyEmail = 'staff';
  static String createStaff = 'staff';
  static String getStaffSchoolInvite = 'staff/pending-school-invite';
  static String getStaffBySchool = 'staff/by-school';

  //metadata
  static const getAllStaffRoles = 'metadata/staff-roles';
  static const getLocationType = 'metadata/location-type';
  static const getVehicleTransmissionTypes = 'metadata/transmission-type';
  static const getScheduleFlow = 'metadata/schedule-flow';
  static const getAllDocumentType = 'metadata/document-type';
  static const getAllinstructorSelectionType = 'metadata/instructor-selection';
  static const getAllCourseCategories = 'metadata/course-categories';
  static const getAllHelpTopics = 'metadata/help-topics';
  static const getAllLanguages = 'metadata/language';
  static const getAllAppFeedbackCategories = 'metadata/feedback-categories';

  //location
  static String suggestLocation = 'location/suggest';
}
