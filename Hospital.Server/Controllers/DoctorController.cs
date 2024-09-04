using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Hospital.Server.DataBaseAccess;
using Hospital.Server.Models;
using Hospital.Server.Models.DtoModels;

namespace Hospital.Server.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class DoctorController : ControllerBase
    {
        private readonly DataBaseContext _context;

        public DoctorController(DataBaseContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<DoctorListModel>>> GetDoctors(int pageNumber = 1, int pageSize = 10, string orderBy = "fullNameASC")
        {
            var doctors = await _context.Doctors.Skip((pageNumber - 1) * pageSize).Take(pageSize)
                .Select(p => new DoctorListModel
                {
                    Id = p.Id,
                    FullName = ($"{p.LastName} {p.FirstName} {p.MiddleName}").Trim(),
                    OfficeNumber = _context.Offices.First(o => o.Id == p.OfficeId).Number,
                    SpecializationName = _context.Specializations.First(s => s.Id == p.SpecializationId).Name,
                    AreaNumber = p.AreaId.HasValue ? _context.Areas.First(a => a.Id == p.AreaId).Number.ToString() : null,
                }).ToListAsync();

            switch(orderBy)
            {
                case "idASC":
                    doctors = doctors.OrderBy(p => p.Id).ToList();
                    break;
                case "fullNameASC":
                    doctors = doctors.OrderBy(p => p.FullName).ToList();
                    break;
                case "officeNumberASC":
                    doctors = doctors.OrderBy(p => p.OfficeNumber).ToList();
                    break;
                case "specializationNameASC":
                    doctors = doctors.OrderBy(p => p.SpecializationName).ToList();
                    break;
                case "areaNumberASC":
                    doctors = doctors.OrderBy(p => p.AreaNumber).ToList();
                    break;
                case "idDESC":
                    doctors = doctors.OrderByDescending(p => p.Id).ToList();
                    break;
                case "fullNameDESC":
                    doctors = doctors.OrderByDescending(p => p.FullName).ToList();
                    break;
                case "officeNumberDESC":
                    doctors = doctors.OrderByDescending(p => p.OfficeNumber).ToList();
                    break;
                case "specializationNameDESC":
                    doctors = doctors.OrderByDescending(p => p.SpecializationName).ToList();
                    break;
                case "areaNumberDESC":
                    doctors = doctors.OrderByDescending(p => p.AreaNumber).ToList();
                    break;
                default:
                    doctors = doctors.OrderBy(p => p.Id).ToList();
                    break;
            }

            return Ok(doctors);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<DoctorListModel>> GetOneDoctor(int id)
        {
            var doctor = await _context.Doctors.FindAsync(id);
            if (doctor == null) return NotFound();

            var oneDoctor = new DoctorListModel{
                Id = doctor.Id,
                FullName = ($"{doctor.LastName} {doctor.FirstName} {doctor.MiddleName}").Trim(),
                OfficeNumber = _context.Offices.First(o => o.Id == doctor.OfficeId).Number,
                SpecializationName = _context.Specializations.First(s => s.Id == doctor.SpecializationId).Name,
                AreaNumber = doctor.AreaId.HasValue ? _context.Areas.First(a => a.Id == doctor.AreaId).Number.ToString() : null,
            };

            return Ok(oneDoctor);
        }

        [HttpPost]
        public async Task<ActionResult<DoctorModel>> AddNewDoctor(string lastName, string firstName, string? middleName, 
            int officeId, int specializationId, int? areaId)
        {
            var doctor = new DoctorModel(lastName, firstName, middleName,
                officeId, specializationId, areaId);

            await _context.Doctors.AddAsync(doctor);
            await _context.SaveChangesAsync();

            return Ok();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateDoctor(int id, DoctorEditModel doctorEdit)
        {
            var doctor = await _context.Doctors.FindAsync(id);
            if (doctor == null) return NotFound();
   
            doctor.OfficeId = doctorEdit.OfficeId;
            doctor.SpecializationId = doctorEdit.SpecializationId;
            doctor.AreaId = doctorEdit.AreaId;

            _context.Entry(doctor).State = EntityState.Modified;
            await _context.SaveChangesAsync();

            return Ok();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteDoctoro(int id)
        {
            var doctor = await _context.Doctors.FindAsync(id);
            if (doctor == null) return NotFound();

            _context.Doctors.Remove(doctor);
            await _context.SaveChangesAsync();

            return Ok();
        }
    }
}
