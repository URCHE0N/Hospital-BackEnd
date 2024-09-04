namespace Hospital.Server.Models.DtoModels
{
    public class DoctorEditModel
    {
        public int Id { get; set; }
        public int OfficeId { get; set; }
        public int SpecializationId { get; set; }
        public int? AreaId { get; set; }
    }
}
