namespace Hospital.Server.Models
{
    public class SpecializationModel
    {
        public SpecializationModel(string name)
        {
            Name = name;
        }

        public int Id { get; set; }
        public string Name { get; set; }
    }
}
