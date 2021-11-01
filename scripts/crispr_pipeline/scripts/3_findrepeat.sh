#!/bin/bash
#SBATCH --job-name="findrepeat"
#SBATCH -A p31378
#SBATCH -p short
#SBATCH -t 02:00:00
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --mem=20G
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu
#SBATCH --output=out_findrepeat.txt
#SBATCH --error=err_findrepeat.txt

module load python/anaconda

python /projects/p31378/comammox/scripts/findRepeatCRISPR.py AACCGGTGCCCACTTCGCTCGAAAAC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR1.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py AAGAAGGAAGAGAAGAAGAGCGGCCATG /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR2.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py AAGAAGGACGAGAAGAAGGGCGGCCAC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR3.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py AAGGATCCGCCGAAGGACTTCCCGAAGGATCCGCCGAAGGACTTCCC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR4.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py AATAGGAGGCATCATCCGTTGAG /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR5.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py ACCGCTTCGCGTGAAGAAAACGCGTCAAAACAATAAT /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR6.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py ACCTATTGAAACGATGTTGCAGC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR7.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py ACGCTAGCAGTTCAGAAATCGCAGGCCAACCGCAAC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR8.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py ACGGCCGGCAGCGCCACGATTAT /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR9.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py ACTTCGGCATCTTGCAGCGCTTTGGTCTT /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR10.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py AGAAGGGAGTGATCATGAAATATCTCTGCCTGGT /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR11.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py AGACCGGCACGAACATGAAAGAGGGCGGCCCGAACCTGAAAATGAGCCACCCTG /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR12.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py AGAGGCGGAGGAGGCTCCACCGC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR13.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py AGCATGATCCCGAAAAGTGGGCACCGGTT /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR14.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py AGGCTCTTGATTTGACGCGTTTTCTTCACGCGAACCGG /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR15.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py AGTCCTGTCGGGCGCACCAACCCACCCAGCTTATCCTCTTGATGT /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR16.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py ATCAATTCGATCAGCGTGAACCC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR17.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py ATCATGGAACGGCTATCAGCGCCG /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR18.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py ATCGCGCCGGTTGTGAGAGCGCTATTTGA /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR19.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py ATCTGAATTCACTCGATTCAGTCC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR20.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py ATTTCCGCGGCTGAAACGCCGCGGCCCCATTGAAGC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR21.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py CAACAAATGGAAGAAAGTGAACACCT /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR22.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py CACGACGTGGCCGCCCTTCTTCTC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR23.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py CAGCGATCAGCCCAACCGGAAGTA /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR24.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py CAGCTCCAGGAACAGAATGGCCAGCT /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR25.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py CCACCCTTCTTCTCTTCCTTCTTGTCGCC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR26.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py CCCTCACCCACCGACAATCACTCTTGTACGA /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR27.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py CCGATGAAGCTGGCCAAGAAAGACGGG /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR28.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py CCGGTTCACGTGAAGAAAACGCGTCAAATCAAGAGCCT /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR29.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py CCGGTTCCATTGATCACGGCCACATC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR30.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py CCTTCATCTTCTTCTGCTCGGCCTT /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR31.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py CGCTCGGCATGATCGGCGATCCTCGGGCG /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR32.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py CGGACCCGCAGCCGATTCCGCCGGC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR33.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py CGGGCAGCTTCCGCTTCTGCTCTT /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR34.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py CGGGGATGGTACGAGAAAGCCGCCGCCCAGGGCCATGCGTGGGCGCAGGCCCA /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR35.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py CGGTTCACCCCCACACGCGTGGGGACCAC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR36.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py CGGTTCACCCCCACGCGTGTGGGGACGAC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR37.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py CGGTTCATCCCCACTCGCGCGGGGAACAC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR38.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py CGTCCTACCGCTAGACGATCCCCCA /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR39.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py CTCCGCCTTCGGTGCCGGGGACCAT /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR40.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py CTGGACGGCATTATATGGAGGGG /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR41.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GAAACACCCCCACGGGCGTGGGGAAGAC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR42.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GAACGAAAAGCTGAAATGGAACAAAAAGCTGAGGCTGAACGAAA /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR43.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GACAGATCGATCGGCAGAGGCCAAAACCGCTTGCGACT /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR44.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GACCTTCGACTCTCCGTGATCGGG /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR45.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GACTGGGGTGCGGCAATGGCTGAACA /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR46.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GAGCAGCGCCTGGAGGCCAAGATCGA /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR47.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GAGCGTCACGCCCACTGCCCCGATCCCGGCCGTCT /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR48.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GATCCGTACAAAATCGGTTGCTG /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR49.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GCATCTCCTACCTGACCATCGAGC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR50.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GCCCCGAGCCCACCGGACAAGTCGTCATCACCATC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR51.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GCCCTTCTTCTCTTCCTTCTTCTT /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR52.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GCCGATGACTGGGGTGCGGCAATGGCTGA /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR53.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GCCGTCATTACCGTGCCTGCCTA /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR54.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GCCTCCCAACCCCGTTAGCCGGTT /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR55.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GCCTTCTTCAGCAGCGGCTCCATCTCCCCTTTGGCCGCCATCGG /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR56.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GCGCGGGGGTCGCCGATCATGCCGAGTG /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR57.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GCTACCAGCACACCATCCCAATCCG /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR58.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GGACCACTGGTTGTCCCCCCAGT /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR59.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GGGCAAACCTCTACGGGGCAAACCT /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR60.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GGGGGAGCCGCAAAGGCACTGCTCATCTCTGCCCCA /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR61.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GTAGCGCCCGCCCTTTGGGGTGGGCGAGGATTGAAAC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR62.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GTAGCGCCCGCTCGAAAGGGCGGGCGAGGATTGAAAC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR63.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GTAGCGCCCGTCCCTCGGGACGGGCGAGGATTGAAAC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR64.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GTAGCGCCCGTCCTTCGGGACGGGCGAGGATTGAAAC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR65.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GTCAGTTGCTCCGCTTCGGCGATGCGGCGCTTGGCTTG /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR66.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GTCGCGCCCCTCGCGGGCGCGTGGATCGAAAC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR67.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GTCTTAATCCCTTTTCTGTCAGGGCATGGTTCGAAC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR68.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GTCTTAATCCCTTTTTCTTCAGGTCGGAATCCCATC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR69.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GTGAGTTCATCTGTGATGCCGAAAGGCGTTGAGCAC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR70.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GTGATGACCTATGAGATGCCGAAAGGCGTTGAGCAC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR71.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GTGGTCCCCACGCGTGTGGGGGTGAACCG /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR72.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GTGTTCCCCACACCCGTGGGGATGAACCG /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR73.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GTGTTCCCCACGCTCGTGGGGATGAACCG /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR74.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GTGTTCCCCGCGCGAGTGGGGATGAACCG /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR75.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GTGTTCCCCGCGCGAGTGGGGATGAACCGG /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR76.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GTTTCAATCCTCGCCCGCCCTTTCGAGCGGGCGCTAC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR77.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GTTTCAATCCTCGCCCGGCCCGAAGGACGGGCGCTAC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR78.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GTTTCAATCCTCGCCCGTCACTAAGGACGGGCGCTAC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR79.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GTTTCGACCCACGCCCCCGCGAAGGGGGCGAC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR80.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py GTTTGCTGCCGCACAGGCAGCTTAGAAA /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR81.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py TATCCTGCTCCCCTTGAAATTAAGACCACC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR82.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py TCACCCTTTCCGGCTCCGGTTTGGTTTTC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR83.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py TCATGGAACGGCTATCAGCGCCG /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR84.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py TCGAAGAACGGCGTCGCTGCGCT /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR85.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py TCGCGACCGTGACATGAAACACCAC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR86.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py TCGGCCTCGATCTTCGACTCGAT /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR87.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py TGCGCGGCGGCGGAGACATCCGCGCCATGGTTGTCACG /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR88.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py TGGTTCATTGAAGAAGTGGGGGTGGATCGGGATC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR89.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py TGGTTGTCGAACCTACCCCGCTACCCCCTACCCC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR90.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py TGTATCAGAAACGAATATTCGAC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR91.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py TGTTTCAATCCTCGCCCGCCCCGAAGGACGGGCGCTAC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR92.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py TTCATGGTACGGCTATCAGCGCCG /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR93.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py TTCCGCCTGACGCGGAACCGGAA /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR94.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py TTCTTCTCGTCGCCGAACACGAC /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR95.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py TTTCCACTCTCGTACTGACCTCG /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR96.txt
# python /projects/p31378/comammox/scripts/findRepeatCRISPR.py TTTGTGACGGATTATCCGTAACA /projects/p31378/comammox/results/crispr2/sourcefile.txt /projects/p31378/comammox/results/crispr2/pooled/DR97.txt
