classdef mapBuilder
    % __author__ = Yepoch
    
    properties
        basicStation_loop = 0
        basicStation_perNum = 6
        basicStation_num = 1
        basicStation_coordinate = 0
        basicStation_range = 1*500
        basicStation_centerRange = 0.6*500
        basicStation_relativeAngle = pi/3*(0:6)
        
        obstacles_coordinate = [100,250*exp(1i*pi/5),250*exp(-1i*pi/5),350]
    end
    
    methods
        function obj = mapBuilder(loop)
            obj.basicStation_loop = loop;
        end
        
        function obj = basicStationCreator(obj)
            basicStation_bottle_relativeAngle = -pi/2-pi/3*(0:6);
            basicStation_bottle_coordinate = 0;
            for k=1:1:obj.basicStation_loop
                basicStation_bottle_coordinate = basicStation_bottle_coordinate+sqrt(3)*obj.basicStation_range*exp(1i*pi/6);
                for pp=1:1:obj.basicStation_perNum
                    for p=1:k
                        obj.basicStation_num = obj.basicStation_num+1;
                        obj.basicStation_coordinate(1,obj.basicStation_num) = basicStation_bottle_coordinate;
                        basicStation_bottle_coordinate = basicStation_bottle_coordinate+sqrt(3)*obj.basicStation_range*exp(1i*basicStation_bottle_relativeAngle(pp)); 
                    end
                end
            end
        end
        
        function printer(obj)
            figure;
            hold on;
            axis square;
            plot(obj.basicStation_range*exp(1i*obj.basicStation_relativeAngle),'k','linewidth',2);
            %aa = linspace(0,pi*2,80);
            for k=1:1:obj.basicStation_num
                zp = obj.basicStation_coordinate(1,k)+obj.basicStation_range*exp(1i*obj.basicStation_relativeAngle);
                g1 = fill(real(zp),imag(zp),'k');
                set(g1,'FaceColor',[1,0.5,0],'edgecolor',[1,0,0]);
                %zr = obj.basicStation_coordinate(1,k)+obj.basicStation_centerRange*exp(1i*aa);
                %g3 = fill(real(zr),imag(zr),'k');
                %set(g3,'FaceColor',[1,0.5,0],'edgecolor',[1,0.5,0],'EraseMode','xor');
                text(real(obj.basicStation_coordinate(1,k)),imag(obj.basicStation_coordinate(1,k)),num2str(k),'fontsize',10);
            end
            g2 = fill(real(obj.obstacles_coordinate),imag(obj.obstacles_coordinate),'k');
        end
        
    end
    
end

