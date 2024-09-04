namespace Hospital.Server.Models.DtoModels
{
    public class PatientListModel
    {
        public int Id { get; set; }
        public string? FullName { get; set; }
        public string? Address { get; set; }
        public string? DateOfBirth { get; set; }
        public string? GenderName { get; set; }
        public int AreaNumber { get; set; }
    }
}
