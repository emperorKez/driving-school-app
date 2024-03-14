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
  static const getAllLanguages = 'metadata/language';
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

  //userRole
  static const getAllUserRoles = 'userRole';

  //transmission types
  static const getAllTransmissionTypes = 'transmissionType';

  //get all questions
  static const getAllQuestions = 'question';

  //helpTopic
  static const getAllHelpTopics = 'metadata/help-topics';

  //feedbackCategory
  static const getAllAppFeedbackCategories = 'metadata/feedback-categories';

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
  static String getSchool(int schoolId) => 'school/$schoolId';
  static String updateSchool(int schoolId) => 'school/$schoolId';
  static String deleteSchool(int schoolId) => 'school/$schoolId';
  static String updateSchoolConfig(int schoolId) => 'school/$schoolId/configurations';


  //driving school page info
  static String getDrivingSchoolPage(int schoolId) =>
      'school/$schoolId/get-driving-school-page';

  //instructor
  static String getInstructorsOfSchool(int schoolId) =>
      'school/$schoolId/instructor';
  static String createNewInstructorForSchool(int schoolId) =>
      'school/$schoolId/instructor';

  //package
  static String getPackagesOfSchool(int schoolId) => 'school/$schoolId/package';
  static String addPackageForSchool(int schoolId) => 'school/$schoolId/package';
  static String updatePackage({
    required int schoolId,
    required int packageId,
  }) =>
      'school/$schoolId/package/$packageId';
  static String deletePackageById({
    required int schoolId,
    required int packageId,
  }) =>
      'school/$schoolId/package/$packageId';

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
  static String getVehiclesOfSchool(int schoolId) => 'school/$schoolId/vehicle';
  static String addVehiclesForSchool(int schoolId) =>
      'school/$schoolId/vehicle';

  //instructor
  static String getInstructor(
          {required int schoolId, required int instructorId}) =>
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
  static String getGroupLesson(
          {required int schoolId, required int groupLessonId}) =>
      'school/$schoolId/groupLesson/$groupLessonId';
  static String updateGroupLesson({
    required int schoolId,
    required int groupLessonId,
  }) =>
      'school/$schoolId/groupLesson/$groupLessonId';
  static String deleteGroupLesson({
    required int schoolId,
    required int groupLessonId,
  }) =>
      'school/$schoolId/groupLesson/$groupLessonId';
  static String addGroupLessonForSchool(int schoolId) =>
      'school/$schoolId/groupLesson';
  static String getGroupLessonsOfSchool(int schoolId) =>
      'school/$schoolId/groupLesson';

  //course
  static String updateCourse({required int schoolId, required int courseId}) =>
      'school/$schoolId/course/$courseId';
  static String getCourse({required int schoolId, required int courseId}) =>
      'school/$schoolId/course/$courseId';
  static String deleteCourse({required int schoolId, required int courseId}) =>
      'school/$schoolId/course/$courseId';
  static String addCourse(int schoolId) => 'school/$schoolId/course';
  static String getCourses(int schoolId) => 'school/$schoolId/course';

  //pickup location
  static String getLocation({
    required int schoolId,
    required int locationId,
  }) =>
      'school/$schoolId/school-location/$locationId';
  static String updateLocation({
    required int schoolId,
    required int locationId,
  }) =>
      'school/$schoolId/school-location/$locationId';
  static String deleteLocation({
    required int schoolId,
    required int locationId,
  }) =>
      'school/$schoolId/school-location/$locationId';
  static String getSchoolLocations(int schoolId) =>
      'school/$schoolId/school-location';
  static String addLocation(int schoolId) => 'school/$schoolId/school-location';
  static String updateLocationStatusActive(
          {required int schoolId, required int locationId}) =>
      'school/$schoolId/school-location/$locationId/active';
  static String updateLocationStatusInactive(
          {required int schoolId, required int locationId}) =>
      'school/$schoolId/school-location/$locationId/inactive';

  //promotion
  static String getPromotion({
    required int schoolId,
    required int promotionId,
  }) =>
      'school/$schoolId/promotion/$promotionId';
  static String updatePromotion({
    required int schoolId,
    required int promotionId,
  }) =>
      'school/$schoolId/promotion/$promotionId';
  static String deletePromotion({
    required int schoolId,
    required int promotionId,
  }) =>
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
  static String updateReviewList({
    required int schoolId,
  }) =>
      'school/$schoolId/review/list';
  static String deleteReview({
    required int schoolId,
    required int reviewId,
  }) =>
      'school/$schoolId/review/$reviewId';
  static String getReviewsOfSchool(int schoolId) => 'school/$schoolId/review';
  static String disApproveReview({
    required int schoolId,
    required int reviewId,
  }) =>
      'school/$schoolId/review/$reviewId/disapprove';
  static String approveReview({
    required int schoolId,
    required int reviewId,
  }) =>
      'school/$schoolId/review/$reviewId/approve';
  static String addReviewForSchool(int schoolId) => 'school/$schoolId/review';

  //vehicle
  static String updateVehicle(
          {required int schoolId, required int vehicleId}) =>
      'school/$schoolId/vehicle/$vehicleId';
  static String getVehicle({required int schoolId, required int vehicleId}) =>
      'school/$schoolId/vehicle/$vehicleId';
  static String deleteVehicle(
          {required int schoolId, required int vehicleId}) =>
      'school/$schoolId/vehicle/$vehicleId';

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
  static String approveStudent({
    required int studentId,
    required int schoolId,
  }) =>
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
  static String getVehicleTransmissionTypes = 'metadata/transmission-type';

//Schedule Flow
  static String getScheduleFlow = 'metadata/schedule-flow';

//document type
  static String getAllDocumentType = 'metadata/document-type';

//instructor selection types
  static String getAllinstructorSelectionType = 'metadata/instructor-selection';

//course categories
  static String getAllCourseCategories = 'metadata/course-categories';
}
