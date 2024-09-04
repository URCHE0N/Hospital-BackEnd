using System.ComponentModel.DataAnnotations;

namespace Hospital.Server.Models
{
    public class AreaModel
    {
        public AreaModel(int number)
        {
            Number = number;
        }

        public int Id { get; set; }

        public int Number { get; set; }
    }
}
