
class ApiRoutes {
  // Api URL
  static final login = "/api/v1/login";
  static final reset = "/auth-challenge";

  static final getFarms = '/api/v1/farms';

  // RA Routes
  static final raGetFarms = "/ra/farms?ra_id={id}"; // Get Method
  static final raCreateNewPond = "/ra/pond";  // Post Method
  static final raEstimatedStocking = '/ra/estimated-stocking'; // Post Method
  static final raGetStocking = '/ra/stocking?pond_id={id}';
  static final raHarvest = '/ra/harvest';
  static final raAddOrUpdateStocking = '/ra/stocking';

  // Farmer Routes
  static final getTestResults = '/farm-mojo/tests/{pondId}';
  static final saveOrUpdateTestResult = '/farm-mojo/test';
  static final addNewPond = '/farm-mojo/pond';
}