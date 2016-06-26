def to_rna(dna):
    dna_rna_dict = {'G': 'C', 'C': 'G', 'T': 'A', 'A': 'U'}
    rna = ''
    for char in dna:
        rna += dna_rna_dict[char]
    return rna
