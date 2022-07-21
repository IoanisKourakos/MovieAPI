using System;
using System.Collections.Generic;

#nullable disable

namespace MoviesCoreAPI.Model
{
    public partial class Rental
    {
        public long RentalId { get; set; }
        public long? MovieId { get; set; }
        public long? PriceId { get; set; }
        public long? UserId { get; set; }
        public DateTime? RentalDate { get; set; }
    }
}
