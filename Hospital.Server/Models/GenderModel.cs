namespace Hospital.Server.Models
{
    public class GenderModel
    {
        public GenderModel(string name)
        {
            Name = name;
        }

        public int Id { get; set; }
        public string Name { get; set; }
    }
}
