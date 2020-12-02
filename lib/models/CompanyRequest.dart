
class CompanyRequest{
  int _companyId;
  String _name;

  CompanyRequest();

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get companyId => _companyId;

  set companyId(int value) {
    _companyId = value;
  }
}