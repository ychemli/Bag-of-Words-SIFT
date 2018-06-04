function [sift] = computeSIFT2( s, Ig, Ior, Mg)

  nbin = 8;
  ps = 4; 
  sift = zeros(s, nbin);
  
  k = 1;

  for i = 1 : s/4
    for j = 1 : s/4
        
      r1 = (i -1) * ps ;
      
      c1 = (j -1) * ps ;
      
      
      h = zeros(nbin, 1);
      
      for r = 1:4
        for c = 1:4
           ori = Ior(r1+r, c1+c);
          if ori ~= 0
            h(ori, 1) = h(ori, 1) + Ig(r1+r, c1+c) * Mg(r,c);
          end
        end
      end
      
      sift(k,:) = h;
      k = k + 1;
    end
  end
  
   sift = reshape(sift.', 1, s * nbin);
   sift = sift.';

   if(norm(sift) < 0.4) 
   sift = zeros(1,128);
   return
   end
 
  sift=sift/norm(sift);
  sift = min(sift,0.2);
  sift=sift/norm(sift);

end









