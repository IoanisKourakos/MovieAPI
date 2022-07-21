using System;
using System.Collections.Generic;

#nullable disable

namespace MoviesCoreAPI.Model
{
    public partial class Movie
    {
        public long MovieId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public DateTime? DateRelease { get; set; }
        public string PromoImage { get; set; }
        public long? DirectorId { get; set; }
        public long? CategoryId { get; set; }
        public long? LanguageId { get; set; }
        public long? RatingId { get; set; }
    }
}
