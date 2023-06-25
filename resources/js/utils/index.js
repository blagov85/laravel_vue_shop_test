const utils = {
    percentRatingStar(rating){
        let percent = (rating / 5) * 100;
        return Math.round(percent);
    },
    percentDiscountProduct(newPrice, oldPrice){
        let percent = ((oldPrice - newPrice) / oldPrice) * 100;
        return Math.round(percent);
    },
    getProductDataToString(arrayObjectData){
        if (arrayObjectData !== null){
            let arrayData = [];
            arrayObjectData.forEach((el,i) => {
                //if only for material
                if(el.percent == null){
                    arrayData[i] = el.title;
                }else{
                    arrayData[i] = el.title + ' - ' + el.percent + '%';
                }  
            });
            let stringData = arrayData.join();
            stringData = stringData.replaceAll(',', ', ');
        return stringData;
        }
        else{
            return '';
        }
    }
}
export default utils;