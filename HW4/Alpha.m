% Codes for defining all operations for the field element
% Example:
%    0 = alpha^n ; 1 = alpha^0 ; alpha^2 = alpha^2 ; ...
% Author : Yu-Cheng Lin 
%          2021. 12. 24 - version 1 

classdef Alpha
   properties
      exponent;
   end
   methods
      %% Initialization
      function obj = Alpha(exponent)
         obj.exponent = exponent;
      end
      %% overloading [{Alpha}^num]
      function obj_out = power(obj_in, num)
         global m_ary;
         exponent = mod(obj_in.exponent * num, m_ary);
         obj_out = Alpha(exponent);
      end
      %% overloading [{Alpha} .* {Alpha}]
      function obj_out = times(obj_in1, obj_in2)
         global m_ary;
         exponent = mod(obj_in1.exponent + obj_in2.exponent, m_ary);
         obj_out = Alpha(exponent);
      end
      %% overloading [{Alpha} * {Alpha}]
      function obj_out = mtimes(obj_in1, obj_in2)
         global m_ary;
         [m, n] = size(obj_in1.exponent);
         if(size(obj_in2.exponent, 1) ~= n) error("The matrix size in wrong for matrix multiplication"); end
         if(n == 1) error("Unsupport size of matrix mutiplication!"); end
         k = size(obj_in2.exponent, 2);
         exponent = zeros(m,k);
         exponent1 = obj_in1.exponent;
         exponent2 = obj_in2.exponent;
         for i_m = 1 : m
            for  i_k = 1 : k
               exponent(i_m,i_k) = sum(Alpha(mod(exponent1(i_m,:) + exponent2(:,i_k).', m_ary))).exponent;
            end
         end
         obj_out = Alpha(exponent);
      end
      %% overloading [{Alpha} + {Alpha}]
      function obj_out = plus(obj_in1, obj_in2)
         exponent1 = obj_in1.exponent;
         exponent2 = obj_in2.exponent;
         if(size(exponent1) ~= size(exponent2)) error('The matrix size is inconsistent in plus operation!'); end
         [row, col] = size(exponent1);
         exponent = zeros(row, col);
         for i_row = 1 : row
            for i_col = 1 : col
               exponent(i_row, i_col) = sum(Alpha([exponent1(i_row,i_col) exponent2(i_row,i_col)])).exponent;
            end
         end
         obj_out = Alpha(exponent);
      end
      %% overloading [sum({[Alpha} {Alpha} ... {Alpha}])]
      function obj_out = sum(obj_in)
         global m_ary;
         global LUT;
         global LUT_reverse;
         exponent = obj_in.exponent;
         exponent(isnan(exponent)) = -1;
         exponent = LUT_reverse(bi2de(mod(sum(LUT(exponent+2,:)),2))+1)-2;
         exponent(exponent == -1) = nan;
         obj_out = Alpha(exponent);
      end
      %% overloading [{Alpha}.']
      function obj_out = transpose(obj_in)
         obj_out = Alpha(obj_in.exponent.');
      end
      %% overloading [{Alpha}(...)]
      function obj_out = subsref(obj_in, idx)
         exponent = obj_in.exponent;
         stype = idx.type;
         if(strcmp(stype,'.') == 1)
            obj_out = exponent;
         elseif(strcmp(stype,'()') == 1)
            subs_len = length(idx.subs);
            [row, col] = size(exponent);
            % convert from matrix indexing to vector indexing
            if(subs_len == 1) idx = idx.subs{1};
            elseif(subs_len == 2) idx = row * (idx.subs{2} - 1) + idx.subs{1}; 
            else error('Unsupported dimension access!'); end
            obj_out = Alpha(exponent(idx));
         else
            error('Unsupported type!')
         end
      end
      %% overloading [[{Alpha} {Alpha}]]
      function obj_out = horzcat(obj_in1, obj_in2)
         exponent = [obj_in1.exponent obj_in2.exponent];
         obj_out = Alpha(exponent);
      end
      %% overloading [{Alpha} ./ {Alpha}]
      function obj_out = rdivide(obj_in1, obj_in2)
         global m_ary;
         exponent1 = obj_in1.exponent;
         exponent2 = obj_in2.exponent;
         exponent = mod(exponent1 - exponent2, m_ary);
         obj_out = Alpha(exponent);
      end

      function obj_out = subsasgn(obj_in, idx, assign_value)
         exponent = obj_in.exponent;
         subs_len = length(idx.subs);
         if(subs_len == 1) idx = idx.subs{1};
         else error('Unsupported matrix size assignment!'); end
         exponent(idx) = assign_value.exponent;
         obj_out = Alpha(exponent);
      end
   end
end