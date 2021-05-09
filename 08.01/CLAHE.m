function RL = CLAHE(img)
RL(:,:,1) = adapthisteq(img(:,:,1), 'NumTiles', [2 2], 'ClipLimit',...
            0.01, 'NBins', 256, 'Range', 'original', 'Distribution',...
            'uniform');
RL(:,:,2) = adapthisteq(img(:,:,2), 'NumTiles', [2 2], 'ClipLimit',...
            0.01, 'NBins', 256, 'Range', 'original', 'Distribution',...
            'uniform');
RL(:,:,3) = adapthisteq(img(:,:,3), 'NumTiles', [2 2], 'ClipLimit',...
            0.01, 'NBins', 256, 'Range', 'original', 'Distribution',...
            'uniform');