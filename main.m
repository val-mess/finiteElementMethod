%
%           % % % % % % % % % % % % % % % % % % % % % % % % %
%           %                                               %
%           %    Fichier Matlab du BE1 d'éléments finis     %
%           %                                               %
%           % % % % % % % % % % % % % % % % % % % % % % % % %
%
%   Objet : Résolution du problème de convection-diffusion en une dimension
%   par éléments finis P1 et P2.
%
%   Fonctionnement : L'exécution de chaque section affiche un certain 
%   nombre de figures relatives à la question dans le sujet. Chaque courbe
%   est analysée dans le compte rendu.
%
%   Attention : bien veiller à avoir toutes les fonctions dans le 
%   repertoire de travail.
%
%
%%

clear all
close all
import DisplaySolEx.m.*
DisplaySolEx()
%% 

clear all
close all
import SolhVsSolEx.m.*
SolhVsSolEx()
%%

clear all
close all
import Err1DDP1.m.*
Err1DDP1()

%%

clear all
close all
import Err1DCP1.m.*
Err1DCP1()

%%

clear all
close all
import Err1DP2.m.*
Err1DP2()

%%

clear all
close all
import P1vsP2.m.*
P1vsP2()

%%

clear all
close all
import DisplayOmega.m.*
DisplayOmega()

%%

clear all
close all
import SolStabP1.m.*
SolStabP1()

%%

clear all
close all
import P1StabvsP1.m.*
P1StabvsP1()