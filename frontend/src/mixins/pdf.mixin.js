import html2pdf from 'html2pdf.js'

export default {
    methods: {
        exportToPdfMixin(el, filename = 'output') {
            const curDate = new Date().toLocaleString().replace(', ', '_').replace(/\./g, '-').replace(/\:/g, '-')
            const opt = {
              margin: 12.5,
              filename: `${filename}_${curDate}`,
              image: { type: 'jpeg', quality: 1 },
              jsPDF: { unit: 'mm', format: 'a4', orientation: 'landscape' }
            }

            html2pdf().set(opt).from(el).save()
        }
    }
}