namespace Hospital.Server.Models
{
    public class DoctorModel
    {
        public DoctorModel(string lastName, string firstName, string? middleName, int officeId, int specializationId, int? areaId)
        {
            LastName = lastName;
            FirstName = firstName;
            MiddleName = middleName;
            OfficeId = officeId;
            SpecializationId = specializationId;
            AreaId = areaId;
        }

        public int Id { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string? MiddleName { get; set; }
        public int OfficeId { get; set; }
        public int SpecializationId { get; set; }
        public int? AreaId { get; set; }
    }
}
