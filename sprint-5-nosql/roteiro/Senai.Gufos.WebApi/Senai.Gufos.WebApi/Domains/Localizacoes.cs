using MongoDB.Bson.Serialization.Attributes;

namespace Senai.Gufos.WebApi.Domains
{
    public class Localizacoes
    {
        [BsonId]
        [BsonRepresentation(MongoDB.Bson.BsonType.ObjectId)]
        public string Id { get; set; }

        [BsonElement("latitude")]
        [BsonRequired]
        public string Latitude { get; set; }

        [BsonRequired]
        public string Longitude { get; set; }

    }
}
