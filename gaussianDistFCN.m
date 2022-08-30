% FILENAME: gaussianDistFCN.m
% FILETYPE: function
% DESCRIPTION: gaussianDistFCN produces a gaussian distribution using the
% randn MATLAB function taking in known parameters such as number of
% samples, 1 standard deviation, and mean
% 
% INPUTS:
%   - numSamples: The number of samples in vector format to be produced
%                Ex. numSamples = [1000,1];
%   - sigma: The standard deviation value for the random variable
%   - mean: The expectation for the given random variable
% OUTPUTS:
%   - gaussianDistVector - Vector of size numSamples containing random
%   values calculated using randn and specified inputs
% AUTHOR(S): Noah Miller (nsm0014@auburn.edu)
% DATE: 8/8/2022 

function [gaussianDistVector] = gaussianDistFCN(numSamples,sigma,mean)

    gaussianDistVector = sigma*randn(numSamples(1),numSamples(2)) + mean;

end
