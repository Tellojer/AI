# Cáncer de mama en TCGA-BRCA: PCA, K-means y hierarchical clustering

¿Contiene la expresión génica de los tumores de mama, por sí sola, grupos de pacientes con significado biológico y clínico?

En este proyecto se analiza la expresión génica por RNA-seq de 1,083 tumores primarios de mama de The Cancer Genome Atlas (TCGA) con aprendizaje no supervisado. Primero se revisan la estructura y la calidad de los datos, y se corrigen anomalías técnicas, como muestras con un protocolo de procesamiento distinto y una fracción mitocondrial muy variable. Después se reducen 5,000 genes a 8 componentes principales con PCA y se agrupan los tumores con K-means y hierarchical clustering, eligiendo el número de clusters con cuatro criterios (variación interna, dendrograma, estabilidad y concordancia entre métodos). Los grupos se interpretan con expresión diferencial, rutas Hallmark, el subtipo PAM50, variables clínicas y modelos de supervivencia de Cox. Por último, una partición inesperada se pone a prueba con patología, pureza medida en DNA y tejido normal adyacente, y se contrasta con un estudio publicado sobre la misma cohorte.

**Resultado principal:** el clustering, sin usar información clínica, separó a los tumores en tres grupos. C1 corresponde al subtipo basal (86 % Basal-like y 81 % triple negativo) y tiene un riesgo de morir por cáncer de mama casi cuatro veces mayor en los primeros tres años, con edad y estadio iguales. La división de los tumores luminales en C2 y C3, en cambio, refleja sobre todo la cantidad de tejido mamario normal incluida en la muestra. El perfil C2 − C3 se parece al del tejido normal (r = 0.74), la partición desaparece al eliminar ese eje (ARI 0.02) y la misma partición, publicada como el subgrupo inmune LumA-R2 (Netanely et al., 2016), tiene una firma casi enteramente de tejido normal. Un clustering estable y asociado a variables clínicas no garantiza haber encontrado un subtipo de la enfermedad.

## Datos

**Fuente:** cohorte [GDC TCGA Breast Cancer (BRCA)](https://xenabrowser.net/datapages/?cohort=GDC%20TCGA%20Breast%20Cancer%20(BRCA)) del Genomic Data Commons, obtenida de la plataforma UCSC Xena (Goldman et al., 2020). Se complementa con fuentes independientes de la misma cohorte, que se enlazan en la tabla de archivos.

**Características:**

| Aspecto | Detalle |
|---|---|
| Registros | 1,226 muestras de 1,095 pacientes (1,106 tumores primarios, 113 de tejido normal y 7 metástasis). Tras excluir las muestras FFPE, sus pares congelados y los duplicados quedan 1,083 tumores, uno por paciente. |
| Variables | 60,660 genes en log2(TPM + 1). Se conservan 19,931 genes codificantes nucleares, de los que 15,496 se expresan y 5,000 se usan para agrupar por su varianza. |
| Variables clínicas | 84 en el fenotipo del GDC (edad, estadio, histología, tratamiento, atributos de la muestra), más receptores hormonales, HER2 y PAM50 de la matriz clínica de TCGA y desenlaces curados de TCGA-CDR. |
| Valores faltantes | Ninguno en la expresión. En el fenotipo, el grado tumoral y la recurrencia no tienen datos, y parte de la información ausente está codificada como texto. |
| Composición de la muestra | Pureza por ESTIMATE y por ABSOLUTE, y revisión patológica de las laminillas. |

## Archivos

| Archivo | Contenido |
|---|---|
| [`reporte4.ipynb`](reporte4.ipynb) | Reporte completo con código, tablas y figuras |
| [`reporte4.html`](reporte4.html) | El mismo reporte en HTML, sin código |
| [`04-Cancer-mama-TCGA-BRCA.pdf`](04-Cancer-mama-TCGA-BRCA.pdf) | El mismo reporte en PDF |
| [GDC TCGA-BRCA en UCSC Xena](https://xenabrowser.net/datapages/?cohort=GDC%20TCGA%20Breast%20Cancer%20(BRCA)) | Expresión génica (STAR-TPM), fenotipo, supervivencia y mapa de genes |
| [GENCODE v36](https://www.gencodegenes.org/human/release_36.html) | Anotación con el tipo de cada gen |
| [Matriz clínica de TCGA-BRCA (UCSC Xena)](https://xenabrowser.net/datapages/?cohort=TCGA%20Breast%20Cancer%20(BRCA)) | Receptores hormonales, HER2, PAM50 y estado menopáusico |
| [TCGA Pan-Cancer Clinical Data Resource](https://gdc.cancer.gov/about-data/publications/pancanatlas) | Desenlaces curados (TCGA-CDR) y pureza por ABSOLUTE |
| [ESTIMATE (MD Anderson)](https://bioinformatics.mdanderson.org/estimate/) | Puntuaciones de estroma, infiltración inmune y pureza |
| [MSigDB Hallmark](https://www.gsea-msigdb.org/gsea/msigdb/human/collections.jsp#H) | 50 conjuntos de genes de procesos biológicos |
| [Portal del GDC](https://portal.gdc.cancer.gov/projects/TCGA-BRCA) | Revisión patológica de las laminillas |
| [Netanely et al. (2016), material suplementario](https://doi.org/10.1186/s13058-016-0724-2) | Asignaciones de clusters publicadas y firma de LumA-R2 |

## Referencias

- Aran, D., Sirota, M., & Butte, A. J. (2015). Systematic pan-cancer analysis of tumour purity. *Nature Communications, 6*, 8971. https://doi.org/10.1038/ncomms9971
- Carter, S. L., Cibulskis, K., Helman, E., McKenna, A., Shen, H., Zack, T., Laird, P. W., Onofrio, R. C., Winckler, W., Weir, B. A., Beroukhim, R., Pellman, D., Levine, D. A., Lander, E. S., Meyerson, M., & Getz, G. (2012). Absolute quantification of somatic DNA alterations in human cancer. *Nature Biotechnology, 30*(5), 413–421. https://doi.org/10.1038/nbt.2203
- Ciriello, G., Gatza, M. L., Beck, A. H., Wilkerson, M. D., Rhie, S. K., Pastore, A., Zhang, H., McLellan, M., Yau, C., Kandoth, C., Bowlby, R., Shen, H., Hayat, S., Fieldhouse, R., Lester, S. C., Tse, G. M. K., Factor, R. E., Collins, L. C., Allison, K. H., ... Perou, C. M. (2015). Comprehensive molecular portraits of invasive lobular breast cancer. *Cell, 163*(2), 506–519. https://doi.org/10.1016/j.cell.2015.09.033
- Elloumi, F., Hu, Z., Li, Y., Parker, J. S., Gulley, M. L., Amos, K. D., & Troester, M. A. (2011). Systematic bias in genomic classification due to contaminating non-neoplastic tissue in breast tumor samples. *BMC Medical Genomics, 4*, 54. https://doi.org/10.1186/1755-8794-4-54
- Frankish, A., Diekhans, M., Jungreis, I., Lagarde, J., Loveland, J. E., Mudge, J. M., Sisu, C., Wright, J. C., Armstrong, J., Barnes, I., Berry, A., Bignell, A., Boix, C., Carbonell Sala, S., Cunningham, F., Di Domenico, T., Donaldson, S., Fiddes, I. T., García Girón, C., ... Flicek, P. (2021). GENCODE 2021. *Nucleic Acids Research, 49*(D1), D916–D923. https://doi.org/10.1093/nar/gkaa1087
- Goldman, M. J., Craft, B., Hastie, M., Repečka, K., McDade, F., Kamath, A., Banerjee, A., Luo, Y., Rogers, D., Brooks, A. N., Zhu, J., & Haussler, D. (2020). Visualizing and interpreting cancer genomics data via the Xena platform. *Nature Biotechnology, 38*(6), 675–678. https://doi.org/10.1038/s41587-020-0546-8
- Grossman, R. L., Heath, A. P., Ferretti, V., Varmus, H. E., Lowy, D. R., Kibbe, W. A., & Staudt, L. M. (2016). Toward a shared vision for cancer genomic data. *New England Journal of Medicine, 375*(12), 1109–1112. https://doi.org/10.1056/NEJMp1607591
- Liberzon, A., Birger, C., Thorvaldsdóttir, H., Ghandi, M., Mesirov, J. P., & Tamayo, P. (2015). The Molecular Signatures Database (MSigDB) hallmark gene set collection. *Cell Systems, 1*(6), 417–425. https://doi.org/10.1016/j.cels.2015.12.004
- Liu, J., Lichtenberg, T., Hoadley, K. A., Poisson, L. M., Lazar, A. J., Cherniack, A. D., Kovatich, A. J., Benz, C. C., Levine, D. A., Lee, A. V., Omberg, L., Wolf, D. M., Shriver, C. D., Thorsson, V., & Hu, H. (2018). An integrated TCGA pan-cancer clinical data resource to drive high-quality survival outcome analytics. *Cell, 173*(2), 400–416.e11. https://doi.org/10.1016/j.cell.2018.02.052
- Netanely, D., Avraham, A., Ben-Baruch, A., Evron, E., & Shamir, R. (2016). Expression and methylation patterns partition luminal-A breast tumors into distinct prognostic subgroups. *Breast Cancer Research, 18*(1), 74. https://doi.org/10.1186/s13058-016-0724-2
- Parker, J. S., Mullins, M., Cheang, M. C. U., Leung, S., Voduc, D., Vickery, T., Davies, S., Fauron, C., He, X., Hu, Z., Quackenbush, J. F., Stijleman, I. J., Palazzo, J., Marron, J. S., Nobel, A. B., Mardis, E., Nielsen, T. O., Ellis, M. J., Perou, C. M., & Bernard, P. S. (2009). Supervised risk predictor of breast cancer based on intrinsic subtypes. *Journal of Clinical Oncology, 27*(8), 1160–1167. https://doi.org/10.1200/JCO.2008.18.1370
- Perou, C. M., Sørlie, T., Eisen, M. B., van de Rijn, M., Jeffrey, S. S., Rees, C. A., Pollack, J. R., Ross, D. T., Johnsen, H., Akslen, L. A., Fluge, Ø., Pergamenschikov, A., Williams, C., Zhu, S. X., Lønning, P. E., Børresen-Dale, A.-L., Brown, P. O., & Botstein, D. (2000). Molecular portraits of human breast tumours. *Nature, 406*(6797), 747–752. https://doi.org/10.1038/35021093
- The Cancer Genome Atlas Network. (2012). Comprehensive molecular portraits of human breast tumours. *Nature, 490*(7418), 61–70. https://doi.org/10.1038/nature11412
- Yoshihara, K., Shahmoradgoli, M., Martínez, E., Vegesna, R., Kim, H., Torres-Garcia, W., Treviño, V., Shen, H., Laird, P. W., Levine, D. A., Carter, S. L., Getz, G., Stemke-Hale, K., Mills, G. B., & Verhaak, R. G. W. (2013). Inferring tumour purity and stromal and immune cell admixture from expression data. *Nature Communications, 4*, 2612. https://doi.org/10.1038/ncomms3612

La bibliografía completa del estudio está al final del reporte.
