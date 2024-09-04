﻿namespace Hospital.Server.Models.DtoModels
{
    public class DoctorListModel
    {
        public int Id { get; set; }
        public string? FullName { get; set; }
        public int OfficeNumber { get; set; }
        public string? SpecializationName { get; set; }
        public string? AreaNumber { get; set; }
    }
}
