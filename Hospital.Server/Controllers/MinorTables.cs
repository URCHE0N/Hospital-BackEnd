using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Hospital.Server.DataBaseAccess;
using Hospital.Server.Models;

namespace Hospital.Server.Controllers
{
    [ApiController]
    public class MinorTables : ControllerBase
    {
        private readonly DataBaseContext _context;

        public MinorTables(DataBaseContext context)
        {
            _context = context;
        }

        [Route("/Areas")]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<AreaModel>>> GetAreas()
        {
            return await _context.Areas.ToListAsync();
        }

        [Route("/Genders")]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<GenderModel>>> GetGenders()
        {
            return await _context.Genders.ToListAsync();
        }

        [Route("/Offices")]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<OfficeModel>>> GetOffices()
        {
            return await _context.Offices.ToListAsync();
        }

        [Route("/Specializations")]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<SpecializationModel>>> GetSpecializations()
        {
            return await _context.Specializations.ToListAsync();
        }
    }
}
