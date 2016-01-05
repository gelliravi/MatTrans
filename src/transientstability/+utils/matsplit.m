function varargout = matsplit(A,dim)
%MATSPLIT Split matrix elements into separate variables.
%   VARARGOUT = MATSPLIT(A) returns each element of the array A in a
%   separate variable defined by VARARGOUT.
%
%   VARARGOUT = MATSPLIT(A,DIM) only splits the matrix in one dimension. If
%   DIM=1, each column vector is assigned to an output variable. If
%   DIM=2, each row vector is assigned to an output variable.
%
%   MRE 11/12/14 (last updated 11/13/14)

if nargin==1
    varargout = num2cell(A);
%     varargout = varargout';
else
    varargout = num2cell(A,dim);
%     varargout = varargout'

end

end
