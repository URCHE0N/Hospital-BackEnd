namespace Hospital.Server.Models
{
    public class PatientModel
    {
        public PatientModel(string lastName, string firstName, string? middleName, string address, DateTime dateOfBirth, int genderId, int areaId)
        {
            LastName = lastName;
            FirstName = firstName;
            MiddleName = middleName;
            Address = address;
            DateOfBirth = dateOfBirth;
            GenderId = genderId;
            AreaId = areaId;
        }

        public int Id { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string? MiddleName { get; set; }
        public string Address { get; set; }
        public DateTime DateOfBirth { get; set; }
        public int GenderId { get; set; }
        public int AreaId { get; set; }
    }
}
