function mipImage = mip(image,width,dim)

    if (dim==3)
        mipImage = zeros(size(image) + [0 0 -width]);
    elseif (dim==2)
        mipImage = zeros(size(image) + [0 -width 0]);
    else
        mipImage = zeros(size(image) + [-width 0 0]);
    end
    
    for i=1:size(image,dim)-width
        if (dim==3)
            mipImage(:,:,i) = squeeze(min(image(:,:,i:width+i),[],dim));
        elseif (dim==2)
            mipImage(:,i,:) = squeeze(min(image(:,i:width+i,:),[],dim));
        else
            mipImage(i,:,:) = squeeze(min(image(i:width+i,:,:),[],dim));
        end
    end
end