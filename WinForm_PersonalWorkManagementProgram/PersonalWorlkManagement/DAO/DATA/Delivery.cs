namespace DAO.DATA
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Delivery")]
    public partial class Delivery
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int maLichLam { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int maDonHang { get; set; }

        public int maLoaiDon { get; set; }

        [StringLength(30)]
        public string tenKhachHang { get; set; }

        public bool thanhToan { get; set; }

        [Required]
        [StringLength(15)]
        public string soDienThoai { get; set; }

        [Required]
        public string diaChi { get; set; }

        public int soTien { get; set; }

        public int tip { get; set; }

        public string note { get; set; }

        public virtual Calendar Calendar { get; set; }

        public virtual LoaiDonHang LoaiDonHang { get; set; }
    }
}
