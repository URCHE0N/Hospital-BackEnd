using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Hospital.Server.DataBaseAccess;
using Hospital.Server.Models;
using Hospital.Server.Models.DtoModels;
using System.Numerics;

namespace Hospital.Server.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class PatientController : ControllerBase
    {
        private readonly DataBaseContext _context;

        public PatientController(DataBaseContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<PatientListModel>>> GetDoctors(int pageNumber = 1, int pageSize = 10, string orderBy = "dateOfBirthASC")
        {
            var patients = await _context.Patients.Skip((pageNumber - 1) * pageSize).Take(pageSize)
                .Select(p => new PatientListModel
                {
                    Id = p.Id,
                    FullName = ($"{p.LastName} {p.FirstName} {p.MiddleName}").Trim(),
                    Address = p.Address,
                    DateOfBirth = p.DateOfBirth.ToShortDateString(),
                    GenderName = _context.Genders.First(g => g.Id == p.GenderId).Name,
                    AreaNumber = _context.Areas.First(a => a.Id == p.AreaId).Number,
                }).ToListAsync();

            switch (orderBy)
            {
                case "idASC":
                    patients = patients.OrderBy(p => p.Id).ToList();
                    break;
                case "fullNameASC":
                    patients = patients.OrderBy(p => p.FullName).ToList();
                    break;
                case "addressASC":
                    patients = patients.OrderBy(p => p.Address).ToList();
                    break;
                case "dateOfBirthASC":
                    patients = patients.OrderBy(p => p.DateOfBirth).ToList();
                    break;
                case "genderNameASC":
                    patients = patients.OrderBy(p => p.GenderName).ToList();
                    break;
                case "areaNumberASC":
                    patients = patients.OrderBy(p => p.AreaNumber).ToList();
                    break;
                case "idDESC":
                    patients = patients.OrderByDescending(p => p.Id).ToList();
                    break;
                case "fullNameDESC":
                    patients = patients.OrderByDescending(p => p.FullName).ToList();
                    break;
                case "addressDESC":
                    patients = patients.OrderByDescending(p => p.Address).ToList();
                    break;
                case "dateOfBirthDESC":
                    patients = patients.OrderByDescending(p => p.DateOfBirth).ToList();
                    break;
                case "genderNameDESC":
                    patients = patients.OrderByDescending(p => p.GenderName).ToList();
                    break;
                case "areaNumberDESC":
                    patients = patients.OrderByDescending(p => p.AreaNumber).ToList();
                    break;
                default:
                    patients = patients.OrderBy(p => p.Id).ToList();
                    break;
            }

            return Ok(patients);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<PatientListModel>> GetOneDoctor(int id)
        {
            var patient = await _context.Patients.FindAsync(id);
            if (patient == null) return NotFound();

            var onePatient = new PatientListModel
            {
                Id = patient.Id,
                FullName = ($"{patient.LastName} {patient.FirstName} {patient.MiddleName}").Trim(),
                Address = patient.Address,
                DateOfBirth = patient.DateOfBirth.ToShortDateString(),
                GenderName = _context.Genders.First(g => g.Id == patient.GenderId).Name,
                AreaNumber = _context.Areas.First(a => a.Id == patient.AreaId).Number,
            };

            return Ok(onePatient);
        }

        [HttpPost]
        public async Task<ActionResult<PatientModel>> AddNewDoctor(string lastName, string firstName, string? middleName,
            string address, DateTime dateOfBirth, int genderId, int areaId)
        {
            var patient = new PatientModel(lastName, firstName, middleName,
                address, dateOfBirth, genderId, areaId);

            await _context.Patients.AddAsync(patient);
            await _context.SaveChangesAsync();

            return Ok();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateDoctor(int id, PatientEditModel patientEdit)
        {
            var patient = await _context.Patients.FindAsync(id);
            if (patient == null) return NotFound();

            patient.GenderId = patientEdit.GenderId;
            patient.AreaId = patientEdit.AreaId;

            _context.Entry(patient).State = EntityState.Modified;
            await _context.SaveChangesAsync();

            return Ok();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteDoctoro(int id)
        {
            var patient = await _context.Patients.FindAsync(id);
            if (patient == null) return NotFound();

            _context.Patients.Remove(patient);
            await _context.SaveChangesAsync();

            return Ok();
        }
    }
}
