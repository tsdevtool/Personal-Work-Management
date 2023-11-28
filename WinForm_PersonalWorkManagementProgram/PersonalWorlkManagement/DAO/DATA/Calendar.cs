namespace DAO.DATA
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Calendar")]
    public partial class Calendar
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Calendar()
        {
            Deliveries = new HashSet<Delivery>();
        }

        [Key]
        public int maLichLam { get; set; }

        [Column(TypeName = "date")]
        public DateTime ngayLam { get; set; }

        public int gioBatDau { get; set; }

        public int gioKetThuc { get; set; }

        public bool Holiday { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Delivery> Deliveries { get; set; }
    }
}
