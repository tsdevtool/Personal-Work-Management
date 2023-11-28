using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace DAO.DATA
{
    public partial class Data : DbContext
    {
        public Data()
            : base("name=Data1")
        {
        }

        public virtual DbSet<Calendar> Calendars { get; set; }
        public virtual DbSet<Delivery> Deliveries { get; set; }
        public virtual DbSet<LoaiDonHang> LoaiDonHangs { get; set; }
        public virtual DbSet<Salary> Salarys { get; set; }
        public virtual DbSet<Shedule> Shedules { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Calendar>()
                .HasMany(e => e.Deliveries)
                .WithRequired(e => e.Calendar)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Delivery>()
                .Property(e => e.soDienThoai)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<LoaiDonHang>()
                .Property(e => e.tenLoai)
                .IsUnicode(false);

            modelBuilder.Entity<LoaiDonHang>()
                .HasMany(e => e.Deliveries)
                .WithRequired(e => e.LoaiDonHang)
                .HasForeignKey(e => e.maLoaiDon)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Shedule>()
                .Property(e => e.lopHoc)
                .IsFixedLength()
                .IsUnicode(false);
        }
    }
}
