using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace P03_FootballBetting.Data.Models
{
    public class Game
    {
        public Game()
        {
            Bets = new HashSet<Bet>();

            PlayerStatistics = new HashSet<PlayerStatistic>();

        }

        [Key]
        public int GameId { get; set; }
        
        [ForeignKey(nameof(HomeTeam))]
        public int HomeTeamId { get; set; }
        public virtual Team HomeTeam { get; set; }

        [ForeignKey(nameof(AwayTeam))]
        public int AwayTeamId { get; set; }
        public virtual Team AwayTeam { get; set; }

        public byte HomeTeamGoals { get; set; }

        public byte AwayTeamGoals { get; set; }

        [Required]
        public DateTime DateTime { get; set; }

        public decimal HomeTeamBetRate { get; set; }

        public decimal AwayTeamBetRate { get; set; }

        public decimal DrawBetRate { get; set; }

        public string Result { get; set; }

        public virtual ICollection<Bet> Bets { get; set; }

        public virtual ICollection<PlayerStatistic> PlayerStatistics { get; set; }




    }
}
