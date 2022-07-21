using System;
using System.Collections.Generic;

#nullable disable

namespace MoviesCoreAPI.Model
{
    public partial class Price
    {
        public long PriceId { get; set; }
        public decimal? DefaultPricePerDay { get; set; }
        public bool? IfOffer { get; set; }
        public DateTime? OfferStartDate { get; set; }
        public DateTime? OfferEndDate { get; set; }
        public decimal? OfferPricePerDay { get; set; }
        public long? MovieId { get; set; }
    }
}
