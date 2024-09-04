namespace Hospital.Server.Models
{
    public class OfficeModel
    {
        public OfficeModel(int number)
        {
            Number = number;
        }

        public int Id { get; set; }
        public int Number { get; set; }
    }
}
