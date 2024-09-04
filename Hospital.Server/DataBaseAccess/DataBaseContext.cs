using Hospital.Server.Models;
using Hospital.Server.Models.DtoModels;
using Microsoft.EntityFrameworkCore;

namespace Hospital.Server.DataBaseAccess
{
    public class DataBaseContext : DbContext
    {
        private readonly IConfiguration _configuration;

        public DataBaseContext (IConfiguration configuration)
        {
            _configuration = configuration;
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(_configuration.GetConnectionString("DataBase"));
        }

        public DbSet<AreaModel> Areas => Set<AreaModel>();
        public DbSet<GenderModel> Genders => Set<GenderModel>();
        public DbSet<OfficeModel> Offices => Set<OfficeModel>();
        public DbSet<SpecializationModel> Specializations => Set<SpecializationModel>();
        public DbSet<DoctorModel> Doctors => Set<DoctorModel>();
        public DbSet<PatientModel> Patients => Set<PatientModel>();
    }
}
